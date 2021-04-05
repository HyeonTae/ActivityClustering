# Activity Clustering using Multimodal Machine Learning for Android Apps

## Overview
This project is activity clustering using multimodal machine learning for android apps.

## Hardware
The models are trained using folloing hardware:
- Ubuntu 18.04.5 LTS
- NVIDA TITAN Xp 12GB
- Intel(R) Xeon(R) W-2145 CPU @ 3.70GHz
- 32GB RAM

## Dependencies
- Python version is 3.6.7
We use the following version of Pytorch.
- torch==1.1.0
- torchtext==0.3.1
Etc. (Included in "requirements.txt")
- numpy==1.16.1
- scikit-learn==0.23.1
- seaborn==0.9.0
- tqdm==4.31.1
- matplotlib==3.0.3
- pandas==0.25.0

## Prerequisite
- Use Tkinter
$ sudo apt-get install python3-tk

- Use virtualenv
$ sudo apt-get install build-essential libssl-dev libffi-dev python-dev
$ sudo apt install python3-pip
$ sudo pip3 install virtualenv
$ virtualenv -p python3 env3
$ . env3/bin/activate
$ # code your stuff
$ deactivate

## Datasets
Our dataset is based on the dataset provided by RICO.
https://storage.cloud.google.com/crowdstf-rico-uiuc-4540/rico_dataset_v0.1/semantic_annotations.zip

## HOW TO EXECUTE OUR MODEL?
## Data Processing
Generate training data based on the RICO dataset and download the RICO latent vector.
```     sh
. ./data_processing.sh
```


=> output
 data/rico/
 data_processing/semantic_annotations/
 data_processing/activate/
 autoencoder/seq2seq/data/all_data.txt
 autoencoder/seq2seq/data/train_data.txt
 autoencoder/seq2seq/data/val_data.txt
 autoencoder/seq2seq/data/test_data.txt

## Seq2seq Autoencoder training and vector extraction
Train the data 5-iterations with the seq2seq autoencoder and extract the latent vector.
$ cd autoencoder/seq2seq
$ . ./train.sh

=> output
 autoencoder/seq2seq/log/
 data/seq2seq_n/

## Conv Autoencoder training and vector extraction
Train the data 5-iterations with the conv autoencoder and extract the latent vector.
$ cd autoencoder/conv
$ . ./train.sh

=> output
 autoencoder/conv/log/
 data/conv_se_n/
 data/conv_re_n/

## Test data extraction and data fusion
Test data is extracted based on pre-categorized ground truth and data fusion is performed with a defined scaling method and weight.
$ cd ../data
$ . ./fusion.sh

=> output

## Clustering
Perform data clustering.
$ cd ../clustering
$ . ./clustering.sh

=> output
 clustering/result/
 clustering/visualization/

## Evaluation
The clustering result is evaluated by Purity, Normalized Mutual Information (NMI), and Adjusted Rand index (ARI).
$ cd ../evaluation
$ . ./evaluation.sh

=> output
 evaluation/csv/

## Nearest neighbor search
You can compare the results of the nearest neighbor search for a test data set. Saves the top 6 images of the search results.
$ cd ../search
$ . ./search.sh

=> output
search/result/

## Known issues
- According to seq2seq training, you may get different latent vectors than ours.
  As a result, you can find different results from our paper.
  Still fusion shows better performance than rico or seq2seq only.

