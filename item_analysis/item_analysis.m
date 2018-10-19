top_dir = '/Volumes/research$/redcay/DSCN Lab/Experiments/CAT/CHT_Scan/CHT_Data/mat files';
script_dir = '~/iCloud/code/CHT/item_analysis/';
cd(script_dir)

% group1
% four runs (1,2,3,4)
subj = {'RED_RL_106', 'RED_CAT_145', 'RED_RL_165', 'RED_RL_155', 'RED_CAT_115', 'RED_CAT_133', 'RED_CAT_132', 'RED_RL_157', 'RED_CHT_ASD_169', 'RED_RL_160', 'RED_CAT_117', 'RED_RL_130', 'RED_CHT_ASD_177', 'RED_CAT_111', 'RED_CHT_ASD_168', 'RED_CAT_107', 'RED_CAT_110', 'RED_RL_146', 'RED_CAT_135', 'RED_RL_111', 'RED_CAT_150', 'RED_CAT_134', 'RED_RL_152', 'RED_RL_124', 'RED_RL_118', 'RED_CAT_144', 'RED_RL_159', 'RED_CAT_123', 'RED_CAT_140', 'RED_RL_150', 'RED_RL_128', 'RED_CAT_118', 'RED_CAT_155', 'RED_RL_163', 'RED_RL_158', 'RED_LL_167', 'RED_LL_187', 'RED_CAT_109'};
runs = [1,2,3,4];
four = trial_data(top_dir,subj,runs);

% three runs (1,2,3)
subj = {'RED_RL_151', 'RED_CHT_ASD_170', 'RED_RL_119', 'RED_CAT_128', 'RED_CAT_124', 'RED_CHT_ASD_171', 'RED_CAT_148', 'RED_RL_162', 'RED_CAT_142'};
runs = [1,2,3];
three123 = trial_data(top_dir,subj,runs);

% three runs (1,2,4)
subj = {'RED_CAT_127', 'RED_CAT_116', 'RED_CAT_104', 'RED_CAT_139', 'RED_RL_154', 'RED_RL_153'};
runs = [1,2,4];
three124 = trial_data(top_dir,subj,runs);

% three runs (1,3,4)
subj = {'RED_CAT_149', 'RED_RL_126'};
runs = [1,3,4];
three134 = trial_data(top_dir,subj,runs);

fin = vertcat(four,three123,three124,three134);
dlmcell('group1.matdat.csv',fin,',') 

clear

%% 
top_dir = '/Volumes/research$/redcay/DSCN Lab/Experiments/CAT/CHT_Scan/CHT_Data/mat files';
script_dir = '~/iCloud/code/CHT/item_analysis/';
cd(script_dir)

% group2
% four runs (1,2,3,4)
subj = {'RED_CAT_228', 'RED_CAT_224', 'RED_CAT_229', 'CHT_CMNT_205', 'RED_CHT_ASD_211', 'RED_CHT_ASD_220', 'RED_CAT_216', 'RED_CAT_218', 'RED_CAT_212', 'RED_CHT_ASD_223', 'RED_CHT_ASD_202', 'RED_CHT_ASD_227', 'RED_CHT_ASD_209', 'RED_CHT_ASD_216', 'RED_CAT_230', 'RED_CAT_226', 'RED_CHT_ASD_218', 'RED_CAT_217', 'CHT_CMNT_201'};
runs = [1,2,3,4];
four = trial_data(top_dir,subj,runs);

% three runs (1,2,3)
subj = {'RED_CHT_ASD_213', 'RED_CHT_ASD_215', 'RED_CHT_ASD_225'};
runs = [1,2,3];
three123 = trial_data(top_dir,subj,runs);

% three runs (1,2,4)
subj = {'RED_CHT_ASD_201', 'RED_CAT_207'};
runs = [1,2,4];
three124 = trial_data(top_dir,subj,runs);

% three runs (2,3,4)
subj = {'RED_CAT_220', 'RED_CHT_ASD_224'};
runs = [2,3,4];
three234 = trial_data(top_dir,subj,runs);


fin = vertcat(four,three123,three124,three234);
dlmcell('group2.matdat.csv',fin,',')

clear




            
