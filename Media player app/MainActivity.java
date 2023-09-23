package com.example.myplayer;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Context;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Message;
import android.view.View;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.os.Handler;


import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
ImageView play,prev,next,imageView;
TextView title;
SeekBar seekBarTime,seekBarvolume;
static MediaPlayer mediaplayer;

private AudioManager audiomanager;
int currentIndex=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        audiomanager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);

        // initializing views
        play=findViewById(R.id.play_btn);
        prev = findViewById(R.id.prev_btn);
        next = findViewById(R.id.next_btn);
        title = findViewById(R.id.title);
        imageView = findViewById(R.id.imageView);
        seekBarTime = findViewById(R.id.seekBarTime);
        seekBarvolume = findViewById(R.id.seekBarvolume);

        // creating an ArrayList to store our songs

        final ArrayList<Integer> songs = new ArrayList<>();

        songs.add(0, R.raw.terevaaste);
        songs.add(1, R.raw.tujhmerabdikhtahai);
        songs.add(2, R.raw.tumhiho);
        songs.add(3, R.raw.devashreeganesha);
        songs.add(4, R.raw.chahumainyana);
        songs.add(5, R.raw.kabir);
        songs.add(6,R.raw.belakinakavithe);
        songs.add(7,R.raw.neralanu);

        // intializing mediaplayer

        mediaplayer = MediaPlayer.create(getApplicationContext(), songs.get(currentIndex));



        // seekbar volume

        int maxV = audiomanager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
        int curV = audiomanager.getStreamVolume(AudioManager.STREAM_MUSIC);
        seekBarvolume.setMax(maxV);
        seekBarvolume.setProgress(curV);

        seekBarvolume.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {

                audiomanager.setStreamVolume(AudioManager.STREAM_MUSIC, progress, 0);
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });


        //above seekbar volume
        //

        play.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                seekBarTime.setMax(mediaplayer.getDuration());
                if (mediaplayer != null && mediaplayer.isPlaying()) {
                    mediaplayer.pause();
                    play.setImageResource(R.drawable.play);
                } else {
                    mediaplayer.start();
                    play.setImageResource(R.drawable.pause);
                }

                songNames();

            }
        });


        next.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (mediaplayer != null) {
                    play.setImageResource(R.drawable.pause);
                }

                if (currentIndex < songs.size() - 1) {
                    currentIndex++;
                } else {
                    currentIndex = 0;
                }

                if (mediaplayer.isPlaying()) {
                    mediaplayer.stop();
                }

                mediaplayer = MediaPlayer.create(getApplicationContext(), songs.get(currentIndex));

                mediaplayer.start();
                songNames();

            }
        });


        prev.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (mediaplayer != null) {
                    play.setImageResource(R.drawable.pause);
                }

                if (currentIndex > 0) {
                    currentIndex--;
                } else {
                    currentIndex = songs.size() - 1;
                }
                if (mediaplayer.isPlaying()) {
                    mediaplayer.stop();
                }

                mediaplayer = MediaPlayer.create(getApplicationContext(), songs.get(currentIndex));
                mediaplayer.start();
                songNames();

            }
        });

    }

    private void songNames() {
        if (currentIndex == 0) {
            title.setText("Tere Vaaste");
            imageView.setImageResource(R.drawable.terevaaste);
        }
        if (currentIndex == 1) {
            title.setText("Tujme Rab Diktha hai");
            imageView.setImageResource(R.drawable.tujmerabdikthahai);
        }
        if (currentIndex == 2) {
            title.setText("Tum Hi Ho");
            imageView.setImageResource(R.drawable.tumhiho);
        }
        if (currentIndex == 3) {
            title.setText("Deva Shree Ganesha");
            imageView.setImageResource(R.drawable.devashreeganesha);
        }
        if (currentIndex == 4) {
            title.setText("Chahu Main ya na");
            imageView.setImageResource(R.drawable.chahumainyana);
        }
        if (currentIndex == 5) {
            title.setText("Kaise hua");
            imageView.setImageResource(R.drawable.kabir);
        }
        if (currentIndex == 6){
            title.setText("Belakina kavithe");
            imageView.setImageResource(R.drawable.img_1);
        }
        if (currentIndex == 7) {
            title.setText("Neralanu kannadha lathe anthe");
            imageView.setImageResource(R.drawable.img_5);
        }

        // seekbar duration
        mediaplayer.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
            @Override
            public void onPrepared(MediaPlayer mp) {
                seekBarTime.setMax(mediaplayer.getDuration());
                mediaplayer.start();
            }
        });

        seekBarTime.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser) {
                    mediaplayer.seekTo(progress);
                    seekBarTime.setProgress(progress);
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });

        new Thread(new Runnable() {
            @Override
            public void run() {
                while (mediaplayer != null) {
                    try {
                        if (mediaplayer.isPlaying()) {
                            Message message = new Message();
                            message.what = mediaplayer.getCurrentPosition();
                            handler.sendMessage(message);
                            Thread.sleep(1000);
                        }
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }).start();
    }

    @SuppressLint("Handler Leak") Handler handler = new Handler () {
        @Override
        public void handleMessage  (Message msg) {
            seekBarTime.setProgress(msg.what);
        }
    };
}

