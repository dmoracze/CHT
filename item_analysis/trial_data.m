function fin = trial_data(dir,subj,runs)
    % take a list of subjects and runs from the CHT experiment and compile
    % some relevant behavioral data
    
    fin = [];
    cc = 0;
    for ss = 1:length(subj)
         load(strcat(dir,'/',subj{ss},'.mat'));
         for rr = 1:length(runs)
             for ii = 1:length(DATA.RunData{1,runs(rr)})
                cc = cc+1
                fin{cc,1} = subj{ss}; % subject ID
                fin{cc,2} = DATA.RunData{1,runs(rr)}{ii,8}; % question
                fin{cc,3} = DATA.RunData{1,runs(rr)}{ii,9}; % peer or comp
                fin{cc,4} = DATA.RunData{1,runs(rr)}{ii,10}; % response
                fin{cc,5} = DATA.RunData{1,runs(rr)}{ii,12}; % outcome
             end
         end
    end
    % subset to remove the disagree trials
    dis = find(cell2mat(fin(:,5)) == 3); % find disagree
    fin(dis,:) = []; % remove disagree
            