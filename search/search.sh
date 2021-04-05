#!/bin/bash
mkdir result

export PYTHONPATH=.
python nearest_neighbor_search.py -d rico
python nearest_neighbor_search.py -d seq2seq
python nearest_neighbor_search.py -d rico_seq2seq_cat_QT-uni_0.6
