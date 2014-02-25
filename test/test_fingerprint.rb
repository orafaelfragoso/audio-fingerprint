require 'test/unit'
require 'audio_fingerprint/fingerprint'

class TestFingerprint < Test::Unit::TestCase

	FILE_PATH1 = '/Users/Rafael/Desktop/previsao.wav'
	FILE_PATH2 = '/Users/Rafael/Desktop/bomdia.wav'

	def test_get_fingerprint
		# Create the instance
		f = AudioFingerprint::Fingerprint.new(FILE_PATH1)
		# Generate Fingerprint
		f.create_fingerprint
		# Fingerprint should be generated in a huge array
		assert_kind_of(Array, f.fingerprint, "The audio fingerprinted was not correct.")
	end

	def test_compare_true
		# Create the instance
		f1 = AudioFingerprint::Fingerprint.new(FILE_PATH1)
		f2 = AudioFingerprint::Fingerprint.new(FILE_PATH1)
		# Generate Fingerprint
		f1.create_fingerprint
		f2.create_fingerprint

		compare  = f1.compare(f2.fingerprint)

		assert_kind_of(Float, compare, "The compare math didn't worked for equal signature.")
	end

	def test_compare_false
		# Create the instance
		f1 = AudioFingerprint::Fingerprint.new(FILE_PATH1)
		f2 = AudioFingerprint::Fingerprint.new(FILE_PATH2)
		# Generate Fingerprint
		f1.create_fingerprint
		f2.create_fingerprint

		compare  = f1.compare(f2.fingerprint)

		assert(!compare, "The compare math didn't worked for a different signature.")
	end

end