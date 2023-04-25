#!/bin/bash
echo "activate conda"
conda activate speech-trans 

python3 run_speech_recognition_ctc.py \
	--dataset_name="test" \
	--model_name_or_path="facebook/wav2vec2-large-xlsr-53" \
	--dataset_config_name="mono" \
	--output_dir="./wav2vec2-fisher-cs_test" \
	--overwrite_output_dir \
	--num_train_epochs="2" \
	--per_device_train_batch_size="16" \
	--gradient_accumulation_steps="2" \
	--learning_rate="3e-4" \
	--warmup_steps="500" \
	--evaluation_strategy="steps" \
	--text_column_name="sentence" \
	--length_column_name="input_length" \
	--save_steps="400" \
	--eval_steps="100" \
	--layerdrop="0.0" \
	--save_total_limit="3" \
	--freeze_feature_encoder \
	--gradient_checkpointing \
	--chars_to_ignore , ? ¿ . !  - @ ¡ ç  \· \¨ \´ \~  \' \` \% \< \> \= \; \: \"  �  \
	--fp16 \
	--group_by_length \
	--do_eval \
	--do_train \
