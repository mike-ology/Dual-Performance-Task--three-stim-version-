# HEADER

scenario = "DUAL 3STIM 2018";
active_buttons = 7;
response_logging = log_active;
no_logfile = true; # default logfile not created
response_matching = legacy_matching;
default_background_color = 128, 128, 128;
default_font = "Arial";
default_font_size = 24;
default_text_color = 0, 0, 0;
default_formatted_text = true;

												###############
												# SDL SECTION #
												###############

begin;

# preload .wav files, cued by filename later in pcl
array {
	sound { wavefile { filename = "sound_1.wav"; preload = true; description = "file 4"; } wav_1; } dual_sound;
	sound { wavefile { filename = "sound_2.wav"; preload = true; description = "file 5";} ; };
	sound { wavefile { filename = "sound_3.wav"; preload = true; description = "file 6";} ; };
	sound { wavefile { filename = "nothing.wav"; preload = true; }; };
}sound_array; 

array{
	bitmap { filename = "shape_1.bmp"; height = 100; scale_factor = scale_to_height; description = "shape_1"; } shape_1;
	bitmap { filename = "shape_2.bmp"; height = 100; scale_factor = scale_to_height; description = "shape_2";} shape_2;
	bitmap { filename = "shape_3.bmp"; height = 100; scale_factor = scale_to_height; description = "shape_3";} shape_3;
	bitmap { filename = "nothing.png"; height = 50; scale_factor = scale_to_height; transparent_color = 0, 0, 0; description = "nothing"; } shape_blank;
}bmp_array;

### DEFINE SOUND TEST

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1, 2, 3, 4;
	all_responses = true;
	stimulus_event {
		picture {
			text { caption = "A section in this task requires you to respond to various sounds."; };
			x = 0; y = 200;
			text { caption = "CURRENT VOLUME"; font_size = 32; font_color = 0, 0, 255; } volume_text;
			x = 0; y = 100;
			text { caption = "Press [A] to play a sound\n\nPress [S] to increase the volume\nPress [D] to decrease the volume"; };
			x = 0; y = -50;
			text { caption = "If you cannot hear anything, you may need to press [ESCAPE] to close the program\nand adjust the volume settings in Windows. The sound output device may be incorrect."; };
			x = 0; y = -200;
			text { caption = "Press [SPACEBAR] when the volume is comfortable to continue"; };
			x = 0; y = -300;
		};
		time = 0;
		duration = next_picture;
		response_active = true;
		target_button = 1, 2, 3, 4;
	};
}sound_test_trial;

# INSTRUCTIONS

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
	all_responses = true;
	stimulus_event {
		picture {
			text { caption = "This is the first of three practice sections.\nEach of the following shapes is paired with the letter below it."; };
			x = 0; y = 300;
			bitmap shape_1;
			x = -100; y = 50;
			bitmap shape_2;
			x = 0; y = 50;
			bitmap shape_3;
			x = 100; y = 50;
			text { caption = "key 1"; }visual_key_1;
			x = -100; y = -50;
			text { caption = "key 2"; }visual_key_2;
			x = 0; y = -50;
			text { caption = "key 3"; }visual_key_3;
			x = 100; y = -50;
			text { caption = "For this section, you will see a shape,\nand you will need to press the key it is paired with.\n\nPress SPACEBAR only when you feel that you have memorised the pairings."; };
			x = 0; y = -300;
		};
		time = 0;
		duration = next_picture;
		response_active = true;
		target_button = 1;
	};
}dual1_instruct;

trial {
	trial_duration = forever;
	trial_type = correct_response;
	all_responses = true;
	stimulus_event {
		picture {
			text { caption = "This is the second of three practice sections.\nEach of the following sounds is paired with the letter below it."; };
			x = 0; y = 300;
			text { caption = "♪    ♪    ♪"; font = "Courier New"; } note_text;
			x = 0; y = 50;
			text { caption = "response mapping placeholder"; } audio_response_keys;
			x = 0; y = -50;
			text { caption = "<b>Press each of the keyboard keys shown to hear the sound.</b>"; };
			x = 0; y = -125;
			text { caption = "For this section, you will hear a sound,\nand you will need to press the key it is paired with.\n\nPress SPACEBAR only when you feel that you have memorised the pairings."; };
			x = 0; y = -300;
		}dual2_instruct_pic;
		time = 0;
		duration = next_picture;
		response_active = true;
		target_button = 1, 2, 3, 4, 5, 6, 7; # updated in PCL to match response mapping
	}dual2_instruct_event;
}dual2_instruct;

trial {
	trial_duration = forever;
	trial_type = correct_response;
	all_responses = true;
	stimulus_event {
		picture {
			text { caption = "This is the third of three practice sections.\nFor this section, you will see a shape AND hear a tone, and you will need to respond to BOTH of them.\nPlease do not press both buttons together. If you do, it will be considered incorrect.\nPlease respond by either pressing the button for the shape first and then the button for the sound\nor by pressing the button for the sound first, then followed by the button for the shape."; };
			x = 0; y = 350;
			bitmap shape_1;
			x = -100; y = 170;
			bitmap shape_2;
			x = 0; y = 170;
			bitmap shape_3;
			x = 100; y = 170;
			text visual_key_1;
			x = -120; y = 70;
			text visual_key_2;
			x = 0; y = 70;
			text visual_key_3;
			x = 120; y = 70;
			text note_text;
			x = 0; y = -40;
			text audio_response_keys;
			x = 0; y = -90;
			text { caption = "<b>Press each of the keyboard keys shown to hear the tone.</b>"; };
			x = 0; y = -170;
			text { caption = "You should aim to make both of your responses as soon as possible."; };
			x = 0; y = -320;
			text { caption = "Once you feel comfortable with the stimulus response mappings, press the SPACEBAR to begin a practice block."; };
			x = 0; y = -420;
		}dual3_instruct_pic;
		time = 0;
		duration = next_picture;
		response_active = true;
		target_button = 1, 2, 3, 4, 5, 6, 7; # updated in PCL to match response mapping
	}dual3_instruct_event;
}dual3_instruct;

trial {
	trial_duration = forever;
	trial_type = correct_response;
	all_responses = true;
	stimulus_event {
		picture {
			text { caption = "This is the test section.\nFor this section, you will be randomly presented with 'shape only', 'sound only', and 'shape and sound' trials."; };
			x = 0; y = 350;
			bitmap shape_1;
			x = -100; y = 250;
			bitmap shape_2;
			x = 0; y = 250;
			bitmap shape_3;
			x = 100; y = 250;
			text visual_key_1;
			x = -100; y = 170;
			text visual_key_2;
			x = 0; y = 170;
			text visual_key_3;
			x = 100; y = 170;
			text note_text;
			x = 0; y = 100;
			text audio_response_keys;
			x = 0; y = 50;
			text { caption = "<b>Press each of the keyboard keys shown to hear the tone.</b>"; };
			x = 0; y = -50;
			text { caption = "You should aim to make your responses as soon as possible."; };
			x = 0; y = -200;
			text { caption = "The blocks in this section are slightly longer than in the previous sections.\n\nOnce you feel comfortable with the stimulus response mappings, press the SPACEBAR to begin the first block."; };
			x = 0; y = -300;
		}dual4_instruct_pic;
		time = 0;
		duration = next_picture;
		response_active = true;
		target_button = 1, 2, 3, 4, 5, 6, 7; # updated in PCL to match response mapping
	}dual4_instruct_event;
}dual4_instruct;


# TRIAL

trial {
	trial_duration = 3000; # updated in PCL
	trial_type = nth_response;
	max_responses = 2;
	all_responses = false;

	stimulus_event {
		picture {
			text { caption = "+"; };
			x = 0; y = 0;
			};
		time = 0;
		duration = next_picture;
		response_active = false;
	};

	stimulus_event {
		picture { 
			bitmap shape_1; # changed in PCL
			x = 0; y = 0;
		}shape_picture;
		time = 1000; # changed in PCL
		duration = 200;
		response_active = true;
		stimulus_time_in = 0;
		stimulus_time_out = 60000;
		target_button = 2, 3, 4, 5, 6, 7;
		code = "visual stimulus";
	}visual_stimulus_event;
	
	stimulus_event {
		sound dual_sound;
		time = 1000; # changed in PCL in parallel?
		#parallel = true;
		response_active = true;
		stimulus_time_in = 0;
		stimulus_time_out = 60000;
		target_button = 2, 3, 4, 5, 6, 7;
		code = "sound stimulus";
	}audio_stimulus_event;
}dual_trial;

picture {
	text { caption = "FEEDBACK"; } feedback_text;
	x = 0; y = 0;
}feedback_pic;

trial {
	trial_type = specific_response;
	terminator_button = 1;
	trial_duration = forever;
	stimulus_event {
		picture {
			text { caption = "Well done! Block X of X complete!"; } block_count ;
			x = 0; y = 100;
			text { caption = "Block accuracy: VALUE"; } block_accuracy;
			x = 0; y = 0;
			text { caption = "Block reaction time: VALUE"; } block_RT;
			x = 0; y = -50;
			text { caption = "You must have 80% accuracy on the final block to proceed to the next section.\nOtherwise, additional blocks will be added until 80% accuracy is achieved."; } accuracy_reminder;
			x = 0; y = -150;
		};
	response_active = true;
	target_button = 1;
	};
}block_summary;

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
	picture {
		text { caption = "WELL DONE"; } span_achieved;
		x = 0; y = 100;
		text { caption = "Thank you! That is the end of the task!\n\nPress SPACE to close the program."; };
		x = 0; y = 0;
	};
}end_of_task;

begin_pcl;

												###############
												# PCL SECTION #
												###############

double volume_level = 0.25;

loop
	bool exit = false
until
	exit == true
begin
	set_system_volume( volume_level, volume_level );
	volume_text.set_caption( "Current volume level: " + string( round( volume_level * 100.0, 0 ) ) + "%", true );
	sound_test_trial.present();
	
	response_data test_response = response_manager.last_response_data();
	
	if test_response.button() == 1 then
		exit = true
	elseif test_response.button() == 2 then
		sound_array[random(1, 4)].present();
	elseif test_response.button() == 3 then
		volume_level = volume_level + 0.05;
		if volume_level > 1.0 then volume_level = 1.0 else end;
	elseif test_response.button() == 4 then
		volume_level = volume_level - 0.05;
		if volume_level < 0.0 then volume_level = 0.0 else end;
	end;
	
end;

##############################################
###   Generate output file

string participant;
int logfile_inc = 1;

if logfile.subject() == "" then
	participant = "NULL 999"
else
	participant = logfile.subject();
end;

string local_path; 
string filename;
string use_local_save;
output_file dual_log = new output_file;

loop
	bool log_success
until
	log_success == true
begin

	use_local_save = parameter_manager.get_string( "Use Local Save", "NO" );
	local_path = "C:/Presentation Output/DUAL3/";
	filename = "DUAL3 - Participant " +  participant + "_" + string( logfile_inc ) + ".txt";

	if use_local_save == "YES" then
		create_directory( local_path );
		if file_exists( local_path + filename ) then
			# do nothing
		else
			dual_log.open( local_path + filename );
			break
		end;

	else
		if file_exists( logfile_directory + filename ) then
			# do nothing
		else
			dual_log.open( filename );
			break
		end;
	end;
	
	logfile_inc = logfile_inc + 1;

end;

##############################################

# Decide response mapping
int dual_mapping;

int last_dig = int (participant.substring( participant.count(), 1 ) ); term.print_line( last_dig );

if	last_dig == 0 || last_dig == 2 || last_dig == 4 || last_dig == 6 || last_dig == 8 then
	dual_mapping = 1;
	
elseif last_dig == 1 || last_dig == 3 || last_dig == 5 || last_dig == 7 || last_dig == 9 then
	dual_mapping = 2;
else
	exit( "ERROR: Participant number did not end in a digit. Unable to calculate mapping." );
end;

term.print_line( "Key mapping: " + string(dual_mapping) );

###   Create logfile headers

string date = date_time();

#string local_path = "C:/Presentation Output/";
#string filename = "DUAL3 - Participant " + string( participant ) + ".txt";

#create_directory( local_path );

#output_file dual_log = new output_file;
#dual_log.open_append( local_path + filename ); 
dual_log.print("DUAL3 Task\n"); 
dual_log.print("Participant "); 
dual_log.print( participant  );
dual_log.print("\n"); #tab
dual_log.print( date );
dual_log.print("\n");#new line
dual_log.print( "Key mapping is " + string( dual_mapping ) ); 

dual_log.print ("\n\n");#new line
dual_log.print ( "Section" ); dual_log.print ("\t");
dual_log.print ( "Block" ); dual_log.print ("\t");
dual_log.print ( "Trial" ); dual_log.print ("\t");
dual_log.print ( "SOA" ); dual_log.print ("\t");
dual_log.print ( "Shape" ); dual_log.print ("\t");
dual_log.print ( "Sound" ); dual_log.print ("\t");
dual_log.print ( "Key 1" ); dual_log.print("\t");
dual_log.print ( "Key 2" ); dual_log.print("\t");
dual_log.print ( "Type 1" ); dual_log.print("\t");
dual_log.print ( "Type 2" ); dual_log.print("\t");
dual_log.print ( "RT 1" ); dual_log.print("\t");
dual_log.print ( "RT 2" ); dual_log.print("\t");
dual_log.print ( "Shp.Res" ); dual_log.print("\t");
dual_log.print ( "Snd.Res" ); 

# Adjust instructions according to response mapping

if dual_mapping == 1 then
	visual_key_1.set_caption( "A", true );
	visual_key_2.set_caption( "S", true );
	visual_key_3.set_caption( "D", true );
	audio_response_keys.set_caption( "J       K       L", true );

	dual2_instruct_event.set_target_button( { 1, 5, 6, 7 } );
	dual3_instruct_event.set_target_button( { 1, 5, 6, 7 } );
	dual4_instruct_event.set_target_button( { 1, 5, 6, 7 } );
elseif dual_mapping == 2 then
	visual_key_1.set_caption( "J", true );
	visual_key_2.set_caption( "K", true );
	visual_key_3.set_caption( "L", true );
	audio_response_keys.set_caption( "A       S       D", true );

	dual2_instruct_event.set_target_button( { 1, 2, 3, 4 } );
	dual3_instruct_event.set_target_button( { 1, 2, 3, 4 } );
	dual4_instruct_event.set_target_button( { 1, 2, 3, 4 } );
else
	term.print_line( "mapping error" );
end;


#array <string> wav_files [4] = { "sound_1.wav",	"sound_2.wav", "sound_3.wav", "nothing.wav" };

# { visual stim, audio stim }
array <int> visual_array [3][2] = { { 1, 4}, { 2, 4 }, { 3, 4 } };
array <int> auditory_array [3][2] = { {4, 1}, { 4, 2}, { 4, 3} };
array <int> dual_array [9][2] = { {1, 1 }, {1, 2},{1, 3},{2, 1},{2, 2},{2, 3},{3, 1},{3, 2},{3, 3} };

array <int> stimulus_list [0][0];

int section = parameter_manager.get_int( "Section Start", 1 );

sub practice_tones
begin
	loop
		string end_practice = "NO"
	until
		end_practice == "break" # actually waiting for break command in loop
	begin
		note_text.set_caption( "♪    ♪    ♪", true );
		
		if section == 2 then
			dual2_instruct.present();
		elseif section == 3 then
			dual3_instruct.present();
		elseif section == 4 then
			dual4_instruct.present();
		end;
		
		response_data trial_response = response_manager.last_response_data();
		int response_key = trial_response.button();
		
		if response_key == 1 then break;
		elseif
			dual_mapping == 1 then
				if response_key == 5 then
					audio_response_keys.set_caption( "<b>J</b>       K       L", true );
					sound_array[1].present();
				elseif response_key == 6 then
					audio_response_keys.set_caption( "J       <b>K</b>       L", true );
					sound_array[2].present();
				elseif response_key == 7 then
					audio_response_keys.set_caption( "J       K       <b>L</b>", true );
					sound_array[3].present();
				end;
		elseif
			dual_mapping == 2 then
				if response_key == 2 then
					audio_response_keys.set_caption( "<b>A</b>       S       D", true );
					sound_array[1].present();
				elseif response_key == 3 then
					audio_response_keys.set_caption( "A       <b>S</b>       D", true );
					sound_array[2].present();
				elseif response_key == 4 then
					audio_response_keys.set_caption( "A       S       <b>D</b>", true );
					sound_array[3].present();
				end;
		else
			term.print_line( "PRP2 instruct error" );
		end;

		if section == 2 then
			dual2_instruct_pic.present();
		elseif section == 3 then
			dual3_instruct_pic.present();
		elseif section == 4 then
			dual4_instruct_pic.present();
		end;

		wait_interval( 500 );
		
		if dual_mapping == 1 then
			audio_response_keys.set_caption( "J       K       L", true );
		elseif dual_mapping == 2 then
			audio_response_keys.set_caption( "A       S       D", true );
		end;
	end;
end; #ENDSUB

loop
until
	section > 4
begin
	
	# SET UP TRIALS BASED ON SECTION
	
	if section == 1 then   
		dual_trial.set_type( correct_response );
		stimulus_list.resize( 0 );
		loop int i = 1 until i > 6 begin
			stimulus_list.append( visual_array );
			i = i + 1;
		end;

	elseif section == 2 then
		dual_trial.set_type( correct_response );
		stimulus_list.resize( 0 );
		loop int i = 1 until i > 6 begin
			stimulus_list.append( auditory_array );
			i = i + 1;
		end;

	elseif section == 3 then  
		dual_trial.set_type( nth_response );
		dual_trial.set_max_responses( 2 );
		stimulus_list.resize( 0 );
		loop int i = 1 until i > 2 begin
			stimulus_list.append( dual_array );
			i = i + 1;
		end;

	elseif section == 4 then   
		dual_trial.set_type( nth_response );
		dual_trial.set_max_responses( 2 );
		stimulus_list.resize( 0 );
		loop int i = 1 until i > 3 begin # *3
			stimulus_list.append( visual_array );
			i = i + 1;
		end;
		loop int i = 1 until i > 3 begin # *3
			stimulus_list.append( auditory_array );
			i = i + 1;
		end;
		loop int i = 1 until i > 1 begin # *9
			stimulus_list.append( dual_array );
			i = i + 1;
		end;
	
	end; #ENDIF - TRIAL PARAMETERS ARE SETUP
	
	# LOAD STIMULI AS REQUIRED AND PRESENT TRIALS
	
	loop
		int block = 1;
		int max_blocks;
		if section == 4 then
			max_blocks = 6 # default = 
		else
			max_blocks = 4 # default =  
		end;
	until
		block > max_blocks
	begin
	
		loop
			int i = 1;
			double correct_count = 0;
			double RT_total = 0;
			stimulus_list.shuffle()
		until
			i > stimulus_list.count()
		begin
			
			if i == 1 then
				if section == 1 && block == 1 then
					dual1_instruct.present();
				elseif section == 2 && block == 1  then
					practice_tones()
				elseif section == 3 && block == 1  then
					practice_tones()
				elseif section == 4 && block == 1  then
					practice_tones()
				end;
			else
			end;
				
			shape_picture.clear();
			shape_picture.add_part( bmp_array[stimulus_list[i][1]], 0.0, 0.0 );
			audio_stimulus_event.set_stimulus( sound_array[stimulus_list[i][2]] );
			#wav_1.unload();
			#wav_1.set_filename( wav_files[stimulus_list[i][2]] );
			#wav_1.load();
			
			# set max responses based on stimuli presented
			if stimulus_list[i][1] == 4 || stimulus_list[i][2] == 4 then
				dual_trial.set_max_responses( 1 )
			else
				dual_trial.set_max_responses( 2 )
			end;
			
			# adjust stimulus timings
			int SOA = random( 200, 600 );
			if i == 1 then
				visual_stimulus_event.set_time( 1000 );
				audio_stimulus_event.set_time( 1000 );
				dual_trial.set_duration( 3000 );
			else
				visual_stimulus_event.set_time( SOA );
				audio_stimulus_event.set_time( SOA );
				dual_trial.set_duration( SOA + 2000 );
			end;

			int response_count_before = response_manager.total_response_count();			
			
			dual_trial.present();

			int response_count_after = response_manager.total_response_count();			
			int trial_response_count = response_count_after - response_count_before;
			
			# GET RESPONSE DATA

			response_data trial_response_1;
			response_data trial_response_2;
			stimulus_data stim_1;
			stimulus_data stim_2;
			string response_type_1;
			string response_type_2 = "NONE";
			string result_1;
			string result_2;
			string shape_result = "WRONG"; # unless edited below based on response
			string sound_result = "WRONG";
			int response_key_1;
			int response_key_2;
			int duration_1;
			int duration_2;
		
			
			if stimulus_list[i][1] == 4 || stimulus_list[i][2] == 4 then
			# single target trial
				response_key_2 = 0;
				duration_2 = 0;

				stim_1 = stimulus_manager.get_stimulus_data( stimulus_manager.stimulus_count() - 1 );
				duration_1 = stim_1.reaction_time();
				if duration_1 == 0 then
					# no response
					response_key_1 = 0
				else
					trial_response_1 = response_manager.last_response_data();
					response_key_1 = trial_response_1.button();
				end;
			else
			# dual target trial
				# first response
				stim_1 = stimulus_manager.get_stimulus_data( stimulus_manager.stimulus_count() - 1 );
				duration_1 = stim_1.reaction_time();
				if duration_1 == 0 then
					# no response
					response_key_1 = 0
				else
					trial_response_1 = response_manager.get_response_data(response_manager.total_response_count() - 1);
					response_key_1 = trial_response_1.button();
				end;
				# last response
				stim_2 = stimulus_manager.last_stimulus_data();
				duration_2 = stim_2.reaction_time();
				if duration_2 == 0 then
					# no response
					response_key_2 = 0
				else
					trial_response_2 = response_manager.last_response_data();
					response_key_2 = trial_response_2.button();
				end;
			end;
			
			# PROCESS RESPONSE DATA
			
			# Determine what stimulus was being responded to
			if	dual_mapping == 1 then
				# first response
				if response_key_1 == 2 || response_key_1 == 3 || response_key_1 == 4 then
					response_type_1 = "SHAPE"
				elseif response_key_1 == 5 || response_key_1 == 6 || response_key_1 == 7 then
					response_type_1 = "SOUND"
				elseif response_key_1 == 0 then
					response_type_1 = "NONE"
				end;
				# second response
				if response_key_2 == 2 || response_key_2 == 3 || response_key_2 == 4 then
					response_type_2 = "SHAPE"
				elseif response_key_2 == 5 || response_key_2 == 6 || response_key_2 == 7 then
					response_type_2 = "SOUND"
				end;
			elseif dual_mapping == 2 then
				# first response
				if	response_key_1 == 5 || response_key_1 == 6 || response_key_1 == 7 then
					response_type_1 = "SHAPE"
				elseif response_key_1 == 2 || response_key_1 == 3 || response_key_1 == 4 then
					response_type_1 = "SOUND"
				elseif response_key_1 == 0 then
					response_type_1 = "NONE"
				end;
				# second response
				if	response_key_2 == 5 || response_key_2 == 6 || response_key_2 == 7 then
					response_type_2 = "SHAPE"
				elseif response_key_2 == 2 || response_key_2 == 3 || response_key_2 == 4 then
					response_type_2 = "SOUND"
				end;
			end;

			if dual_mapping == 1 then

				if (response_key_1 == 2 && stimulus_list[i][1] == 1) || 
				   (response_key_1 == 3 && stimulus_list[i][1] == 2) || 
				   (response_key_1 == 4 && stimulus_list[i][1] == 3)
						then
							shape_result = "CORRECT"
				elseif
				   (response_key_1 == 5 && stimulus_list[i][2] == 1) || 
				   (response_key_1 == 6 && stimulus_list[i][2] == 2) || 
				   (response_key_1 == 7 && stimulus_list[i][2] == 3)
						then
							sound_result = "CORRECT"
				else
					# nothing
				end;
				
				if
				   (response_key_2 == 2 && stimulus_list[i][1] == 1) || 
				   (response_key_2 == 3 && stimulus_list[i][1] == 2) || 
				   (response_key_2 == 4 && stimulus_list[i][1] == 3)
						then
							shape_result = "CORRECT"
				elseif			
				   (response_key_2 == 5 && stimulus_list[i][2] == 1) || 
				   (response_key_2 == 6 && stimulus_list[i][2] == 2) || 
				   (response_key_2 == 7 && stimulus_list[i][2] == 3)
						then
							sound_result = "CORRECT"
				else
					# nothing
				end;

			elseif dual_mapping == 2 then

				if (response_key_1 == 5 && stimulus_list[i][1] == 1) || 
				   (response_key_1 == 6 && stimulus_list[i][1] == 2) || 
				   (response_key_1 == 7 && stimulus_list[i][1] == 3)
						then
							shape_result = "CORRECT"
				elseif
				   (response_key_1 == 2 && stimulus_list[i][2] == 1) || 
				   (response_key_1 == 3 && stimulus_list[i][2] == 2) || 
				   (response_key_1 == 4 && stimulus_list[i][2] == 3)
						then
							sound_result = "CORRECT"
				else
					# nothing
				end;
				
				if
				   (response_key_2 == 5 && stimulus_list[i][1] == 1) || 
				   (response_key_2 == 6 && stimulus_list[i][1] == 2) || 
				   (response_key_2 == 7 && stimulus_list[i][1] == 3)
						then
							shape_result = "CORRECT"
				elseif			
				   (response_key_2 == 2 && stimulus_list[i][2] == 1) || 
				   (response_key_2 == 3 && stimulus_list[i][2] == 2) || 
				   (response_key_2 == 4 && stimulus_list[i][2] == 3)
						then
							sound_result = "CORRECT"
				else
					# nothing
				end;
	
			else
				term.print_line( "RESULT ERROR" );
			end;

			# Account for 'no-response'
			if stimulus_list[i][1] == 4 && duration_1 == 0 then
				# sound only trial
				sound_result = "TOO SLOW"
			elseif stimulus_list[i][2] == 4 && duration_1 == 0 then
				# shape only trial
				shape_result = "TOO SLOW"
			elseif stimulus_list[i][2] != 4 && stimulus_list[i][1] != 4 then
				# dual trials
				if (response_type_1 == "SHAPE" && response_type_2 == "NONE") || (response_type_1 == "NONE" && response_type_2 == "SHAPE") then
					# shape response, sound missed
					sound_result = "TOO SLOW"
				elseif (response_type_1 == "SOUND" && response_type_2 == "NONE") || (response_type_1 == "NONE" && response_type_2 == "SOUND") then
					# sound response, shape missed
					shape_result = "TOO SLOW"
				elseif (response_type_1 == "NONE" && response_type_2 == "NONE") then
					# shape and sound missed
					sound_result = "TOO SLOW";
					shape_result = "TOO SLOW"
				else
				end;
			else
			end;
				
			# Edit feedback based on stimuli presented
			if stimulus_list[i][2] == 4 then
				feedback_text.set_caption( shape_result, true );
				sound_result = "N/A";
			elseif stimulus_list[i][1] == 4 then
				feedback_text.set_caption( sound_result, true );
				shape_result = "N/A"
			else
				feedback_text.set_caption( "Shape: " + shape_result + "\nSound: " + sound_result, true );
			end;		
				
			# Adjust feedback and present
			if (response_type_1 == "SHAPE" && response_type_2 == "SHAPE") || (response_type_1 == "SOUND" && response_type_2 == "SOUND") then
				feedback_text.set_caption( "WARNING! Multiple responses to one stimulus type detected.\nOnly make a single response to each shape and sound.", true );
				feedback_pic.present();
				wait_interval( 5000 );
				shape_result = "ERROR1";
				sound_result = "ERROR1";
			elseif section == 4 then
				feedback_text.set_caption( " ", true );
				feedback_pic.present();
				wait_interval( 500 );
			else
				feedback_pic.present();
				wait_interval( 500 );
			end;
			
			# IS OVERALL TRIAL CORRECT
			if (shape_result == "CORRECT" && sound_result == "CORRECT") ||
			   (shape_result == "CORRECT" && sound_result == "N/A") ||
			   (shape_result == "N/A" && sound_result == "CORRECT")
				then
					correct_count = correct_count + 1.0;
					if duration_2 == 0 then
						RT_total = RT_total + duration_1
					else
						RT_total = RT_total + duration_2
					end;
			else
			end;
					
			# LOG RESPONSE DATA
			dual_log.print ("\n");#new line
			dual_log.print ( section ); dual_log.print ("\t");
			dual_log.print ( block ); dual_log.print ("\t");
			dual_log.print ( i ); dual_log.print ("\t");
			dual_log.print ( SOA ); dual_log.print ("\t");
			dual_log.print ( stimulus_list[i][1] ); dual_log.print ("\t");
			dual_log.print ( stimulus_list[i][2] ); dual_log.print ("\t");
			dual_log.print ( response_key_1 ); dual_log.print ("\t");
			dual_log.print ( response_key_2 ); dual_log.print ("\t");
			dual_log.print ( response_type_1 ); dual_log.print ("\t");
			dual_log.print ( response_type_2 ); dual_log.print ("\t");
			dual_log.print ( duration_1 ); dual_log.print ("\t");
			dual_log.print ( duration_2 ); dual_log.print ("\t");
			dual_log.print ( shape_result ); dual_log.print ("\t");
			dual_log.print ( sound_result ); dual_log.print ("\t");

			
			if i == stimulus_list.count() then
				double percent_correct = round( correct_count / i * 100, 0 );

				double average_RT = 0;
				if correct_count != 0 then
					average_RT = round( RT_total / correct_count, 0 )
				else
				end;

				if block == max_blocks && percent_correct < 80.0 && section != 4 then
					max_blocks = max_blocks + 1;
				else
				end;
				
				block_count.set_caption( "Well done! Block " + string( block ) + " of " + string( max_blocks ) + " complete.", true );
				block_accuracy.set_caption( "Block accuracy: " + string( percent_correct ) + "%", true );
				block_RT.set_caption( "Block reaction time: " + string( average_RT ) + "ms", true );
				
				if section == 4 then
					# remove accuracy reminder in the final section
					accuracy_reminder.set_caption( " ", true );
				else
				end;
				
				block_summary.present();
			
			else
			end;

			i = i + 1;
				
		end;
	
		block = block + 1;
	end;
	
	section = section + 1;
	
end; #ENDLOOP

double time = ( double ( clock.time()) )/60000.00;
dual_log.print ( "\nTime to completion\t " );
dual_log.print ( string( round( time, 2) ) + "\tminutes" ); 

dual_log.print( "\n\n===== END OF FILE =====\n\n" );

#########################################################
# Subroutine to copy logfile back to the default location
# Requires the strings associated with:
#	[1] the local file path
#	[2] the file name
#	[3] if save operation is to be performed ("YES"/"NO") 

dual_log.close();

bool copy_success = true;
double starting_scale_factor = 1.0;
picture prompt_pic = new picture();
include "sub_generate_prompt.pcl";
include "sub_force_local_save.pcl";

sub_save_to_network( local_path, filename, use_local_save );	

create_new_prompt( 1 );

if copy_success == true then
	prompt_message.set_caption( "End of task! Thank you!\n\nPlease notify the experimenter.\n\n<font color = '0,255,0'>LOGFILE WAS SAVED TO DEFAULT LOCATION</font>", true )
elseif copy_success == false then
	prompt_message.set_caption( "End of task! Thank you!\n\nPlease notify the experimenter.\n\n<font color = '255,0,0'>LOGFILE WAS SAVED TO:\n</font>" + local_path, true );
else
end;

mid_button_text.set_caption( "Press [SPACE] to close the program", true );

#########################################################

end_of_task.clear_stimulus_events();
end_of_task.add_stimulus_event( prompt_pic );
end_of_task.present();