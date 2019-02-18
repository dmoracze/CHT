# CHT condition specific motion analysis

For the CHT experiment there are 2 response event factors of interest:
chat partner x response contingency

This code results in a data frame that includes condition-specific motion information to answer questions such as: Do participants move more during the peer compared to the computer trials?

1. afni_cond_motion_analysis

This tcsh script uses already existing AFNI tools to:
* create binary on/off timing vectors (using [timing_tool.py](https://afni.nimh.nih.gov/pub/dist/doc/program_help/timing_tool.py.html))
* create a vector of collapsed column motion derivatives (using [1d_tool.py](https://afni.nimh.nih.gov/pub/dist/doc/program_help/1d_tool.py.html))

2. CHT_condition_motion_analysis.R

Given a list of subjects and conditions, this R script reads in the aforementioned timing and motion vectors and averages the mean FD across each condition. 

