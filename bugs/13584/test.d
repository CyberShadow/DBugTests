import std.conv;
import std.stdio;

import deimos.portaudio;

void main ()
	{/*...}*/
		PaStreamParameters inputP, outputP;
		PaStream* stream;
		PaError err = paNoError;

		err = Pa_Initialize;
		assert (err == paNoError);

		inputP.device = Pa_GetDefaultInputDevice;

		assert (inputP.device != paNoDevice);

		with (inputP)
			{/*...}*/
				channelCount = 1;
				sampleFormat = paFloat32;
				suggestedLatency = Pa_GetDeviceInfo (device).defaultLowInputLatency;
			}

		enum sampleRate = 44100.0;
		enum recTime = 10;

		float[sampleRate.to!size_t * recTime] data;

		err = Pa_OpenStream (&stream,
			cast(const(PaStreamParameters*))&inputP,
			cast(const(PaStreamParameters*))null,
			44100.0,
			paFramesPerBufferUnspecified.to!uint,
			paClipOff,
			&record,
			cast(void*)data.ptr
		);
		assert (err == paNoError);

		Pa_StartStream (stream);
		foreach (i; 0..100)
			{/*...}*/
				Pa_Sleep (100);
				//writeln (maxed*50);
			}
		Pa_StopStream (stream);

		Pa_Terminate;
	}
