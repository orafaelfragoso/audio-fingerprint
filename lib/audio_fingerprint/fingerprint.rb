require 'audio_fingerprint/wave_file'
require 'fftw3'

class Float
	def to_near
		(self+0.5).to_i
	end
end

module AudioFingerprint
	class Fingerprint

		BITS_PER_RAW_ITEM = 32
		THRESHOLD = 0.85

		attr_accessor :fingerprint
		attr_accessor :file

		def initialize(file)
			@fingerprint = []
			@file = file
		end

		def create_fingerprint
			w    		 = AudioFingerprint::WaveFile.open(@file)
			samples  	 = w.sample_data[0, [w.sample_rate * 10, w.sample_data.size].min]
			duration 	 = samples.size / w.sample_rate
			na 			 = NArray.float(2, samples.size)
			@fingerprint ||= []
			
			samples.each_with_index do |v, i|
				na[0, i - 1] = i.to_f / w.sample_rate.to_f
				na[1, i - 1] = v
			end

			fa = FFTW3.fft(na)
			fa = fa.real.abs

			fa.each do |f|
				@fingerprint << f
			end
		end

		def compare(fp)
			max_raw_size = [@fingerprint.size, fp.size].max
			bit_size     = max_raw_size * BITS_PER_RAW_ITEM

			distance     = hamming_distance(@fingerprint, fp)

			match 		 = 1 - distance.to_f / bit_size

			if match >= THRESHOLD
				match
			else
				false
			end
		end

		private

		def hamming_distance(raw1, raw2)
			distance = 0

			min_size, max_size = [raw1, raw2].map(&:size).sort

			min_size.times do |i|
				distance += (raw1[i].to_near ^ raw2[i].to_near).to_s(2).count('1')
			end

			distance += (max_size - min_size) * BITS_PER_RAW_ITEM
		end

	end
end