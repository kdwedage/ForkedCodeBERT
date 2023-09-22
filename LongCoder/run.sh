#!/bin/bash

lang=csharp #csharp, python, java
lr=2e-4
batch_size=1
beam_size=5
source_length=3968
target_length=128
global_length=64
window_size=512
epochs=10
output_dir=saved_models/$lang
mkdir -p $output_dir

python run.py \
	--do_train \
	--do_eval \
	--lang $lang \
	--output_dir $output_dir \
	--model_name_or_path microsoft/longcoder-base \
	--filename microsoft/LCC_$lang \
	--max_source_length $source_length \
	--max_target_length $target_length \
	--max_global_length $global_length \
	--window_size $window_size \
	--beam_size $beam_size \
	--train_batch_size $batch_size \
	--eval_batch_size $batch_size \
	--learning_rate $lr \
	--num_train_epochs $epochs  2>&1| tee $output_dir/train.log
