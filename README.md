# Audio::Fingerprint

This gem was built to help not only developers but enthusiasts to have a start with audio fingerprint. 

## Pre-requisites

To fingerprint audio you must have a wav file with this configuration:

- 1 Channel (Mono)
- 32 bits float
- 44100Hz

Also, make sure you installed the FFTW library:

```brew install fftw```

Or... you can download the source and compile the code if you're on Linux.

## Installation

Add this line to your application's Gemfile:

```gem 'audio-fingerprint'```

And then execute:

```$ bundle```

Or install it yourself as:

```$ gem install audio-fingerprint```

## Usage

```ruby
# Instantiate
f = AudioFingerprint::Fingerprint.new(full-path-to-file)
# Create the fingerprint
f.create_fingerprint
# Get the fingerprinted array
f.fingerprint

# You can compare 2 fingerprints like this:
f1.compare(f2.fingerprint) # return the match percentage or false
```

### Terminal

```audio_fingerprint```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/audio-fingerprint/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

This was not 100% me, a lot of this code was spread in the internet and I wanna thank you these people for their good work and to share it with us.

- [wavefile gem](https://github.com/jstrait/wavefile) - I took a class from version 0.3.0
- [companygardener gist](https://gist.github.com/companygardener/486711) - This Gist was very helpful to fingerprint the audio files
- [How to compare audio in Ruby](https://gist.github.com/companygardener/486711) - This was really helpful, and I adapted his fingerprint class to fit my needs.


## Future

I really want to push this forward and make cool things with it, you guys can help me with pull requests and ideas. Here’s what I want to accomplish:

- Support for multiple audio formats, frequencies and channels
- Ability to recognize multiple audio fingerprints in one fingerprint (like Google Speech API does, transform a phrase into text words).
 - This will require a database to store the fingerprinted words to compare them with the fingerprinted phrase.

Thanks guys!