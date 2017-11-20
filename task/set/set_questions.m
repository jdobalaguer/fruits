
questions = struct();

%% valid-invalid
vi = struct();

% structure
vi.structure      = [ 1, 5, 9; 1, 5,10; 1, 6,11; 1, 6,12; 2, 7, 9; 2, 7,10; 2, 8,11; 2, 8,12; 3, 8, 9; 3, 8,10; 3, 5,11; 3, 5,12; 4, 6, 9; 4, 6,10; 4, 7,11; 4, 7,12];

% build  all valid trials
vi.valid.image    = cat(1,vi.structure(:,[1,2,3]),...
                          vi.structure(:,[3,1,2]),...
                          vi.structure(:,[2,3,1]),...
                          vi.structure(:,[1,2,3]),...
                          vi.structure(:,[3,1,2]),...
                          vi.structure(:,[2,3,1]));
                      
% shuffle left/right valid sample
vi.valid.shuffle   = randi(2,size(vi.valid.image,1),1);
vi.valid.image     = cat(2, vi.valid.image(sub2ind(size(vi.valid.image), mat2vec(1:size(vi.valid.image,1)), vi.valid.shuffle)), ...
                            vi.valid.image(sub2ind(size(vi.valid.image), mat2vec(1:size(vi.valid.image,1)), 3-vi.valid.shuffle)), ...
                            vi.valid.image(:,3));
% define valid salads           
vi.valid.salad     = repmat(mat2vec(1:16),[6,1]);
vi.valid.permute   = mat2vec(repmat(1:6,[16,1]));
vi.valid.valid     = ones(size(vi.valid.image,1),1);
vi.valid.day       = mat2vec(repmat([1,2],[48,1]));
vi.valid.level     = ceil(vi.valid.image / 4);

% filter out salads
for i_day = 1:2
for i_level = 1:3
    ii_day   = (vi.valid.day        == i_day);
    ii_level = (vi.valid.level(:,3) == i_level);
    ii_discard = shuffle(find(ii_day & ii_level));
    ii_keep = true(size(ii_day));
    ii_keep(ii_discard(1:4)) = 0;
    vi.valid = struct_filter(vi.valid,ii_keep);
end
end
clear i_day i_level ii_day ii_level ii_discard ii_keep;

% build invalid trials
vi.invalid = vi.valid;
s = nan;
while any(vi.invalid.valid)
    % find trials that are not invalid
    ii_valid       = (vi.invalid.valid == 1);
    ii_valid       = ii_valid | (vi.invalid.image(:,1) == vi.invalid.image(:,3));
    ii_valid       = ii_valid | (vi.invalid.image(:,2) == vi.invalid.image(:,3));
    ii_valid       = find(ii_valid);
    % suggest a permutation for the probes (only valid salads)
    ii_permutation = randperm(length(ii_valid));
    vi.invalid.image(ii_valid,3) = vi.invalid.image(ii_valid(ii_permutation),3);
    vi.invalid.level             = ceil(vi.invalid.image / 4);
    % salad counts as valid if it has all 3 levels
    vi.invalid.valid             = all(cell2mat(cellfun(@sort,mat2cell(vi.invalid.level,ones(size(vi.invalid.level,1),1),3),'unif',0)) == [1,2,3],2);
    % if the cardinal of valid salads didn't go down, chances are we're stuck. restart.
    if sum(vi.invalid.valid) == s, vi.invalid = vi.valid; end
    s = sum(vi.invalid.valid);
    % check solution
    if ~any(vi.invalid.valid)
        % restart if the solution is too unbalanced across levels/days
        [~,~,h] = unique(vi.invalid.level + 3*(vi.invalid.day-1),'rows');
        h = hist(h,1:24);
        if ~all(ismember(h,[1:5])), vi.invalid = vi.valid; end
    end
end
clear s h ii_permutation ii_valid

% concatenate and shuffle
vi.trial = struct_concat(1,vi.valid,vi.invalid);
vi.trial = struct_filter(vi.trial, randperm(size(vi.trial.image,1)));

% save
questions.vi.image = vi.trial.image;
questions.vi.valid = vi.trial.valid;
questions.vi.day   = repmat(vi.trial.day,[1,3]);
questions.vi.level = vi.trial.level;
                        
% isi
questions.vi.isi = linspace(parameters.time_vi_isimin,parameters.time_vi_isimax,parameters.task_nbtrials_vi)';
questions.vi.isi = {questions.vi.isi};
questions.vi.isi = repmat(questions.vi.isi,[1,sum(strcmp(parameters.task_sessions,'vi'))]);
questions.vi.isi = cellfun(@shuffle,questions.vi.isi,'UniformOutput',false);
questions.vi.isi = cat(1,questions.vi.isi{:});

% sort
questions.vi = struct_sort(questions.vi);

% clean
clear vi;

%% repetition suppression
rs = struct();

% build the 432 trials
[rs.s,rs.p] = ndgrid(1:24,1:24);
rs = struct_mat2vec(rs);
rs = struct_filter(rs, mod1(rs.s,4)~=mod1(rs.p,4));

% translate sample conditions
rs.sample.image = mod1(rs.s,12);
rs.sample.level = ceil(rs.sample.image/4);
rs.sample.day   = ceil(rs.s/12);

% translate probe conditions
rs.probe.image = mod1(rs.p,12);
rs.probe.level = ceil(rs.probe.image/4);
rs.probe.day   = ceil(rs.p/12);

% merge
questions.rs.image = [rs.sample.image,rs.probe.image];
questions.rs.day   = [rs.sample.day,  rs.probe.day];
questions.rs.level = [rs.sample.level,rs.probe.level];

% filter out half the invalid trials
for i_day1   = 1:2
for i_day2   = 1:2
for i_level1 = 1:3
for i_level2 = 1:3
    
    % indices
    if i_level1==i_level2, continue; end
    ii_day1   = (questions.rs.day(:,1)   == i_day1);
    ii_day2   = (questions.rs.day(:,2)   == i_day2);
    ii_level1 = (questions.rs.level(:,1) == i_level1);
    ii_level2 = (questions.rs.level(:,2) == i_level2);
    
    % select 50% at random
    ii_discard = (ii_day1 & ii_day2 & ii_level1 & ii_level2);
    ii_discard = shuffle(find(ii_discard));
    ii_discard = ii_discard(1:(length(ii_discard)/2));
    
    % filter those out
    ii_keep    = true(size(ii_day1));
    ii_keep(ii_discard) = false;
    questions.rs = struct_filter(questions.rs,ii_keep);
end
end
end
end
clear i_day1 i_day2 i_level1 i_level2
clear ii_day1 ii_day2 ii_level1 ii_level2 ii_discard ii_keep

% add an extra half of trials again!
for i_day1   = 1:2
for i_day2   = 1:2
for i_level1 = 1:3
for i_level2 = 1:3
    
    % indices
    ii_day1   = (questions.rs.day(:,1)   == i_day1);
    ii_day2   = (questions.rs.day(:,2)   == i_day2);
    ii_level1 = (questions.rs.level(:,1) == i_level1);
    ii_level2 = (questions.rs.level(:,2) == i_level2);
    
    % select half at random
    ii_concat = (ii_day1 & ii_day2 & ii_level1 & ii_level2);
    ii_concat = shuffle(find(ii_concat));
    ii_concat = ii_concat(1:(length(ii_concat)/2));
    
    % concatenate
    questions.rs = struct_concat(1,questions.rs,struct_filter(questions.rs,ii_concat));
end
end
end
end
clear i_same i_day1 i_day2 i_level1 i_level2
clear ii_same ii_day1 ii_day2 ii_level1 ii_level2 ii_concat

% match
questions.rs.match = double((questions.rs.day(:,1) == questions.rs.day(:,2)));

% shuffle
questions.rs = struct_filter(questions.rs, randperm(432));

% isi
questions.rs.isi = linspace(parameters.time_rs_isimin,parameters.time_rs_isimax,parameters.task_nbtrials_rs)';
questions.rs.isi = {questions.rs.isi};
questions.rs.isi = repmat(questions.rs.isi,[1,sum(strcmp(parameters.task_sessions,'rs'))]);
questions.rs.isi = cellfun(@shuffle,questions.rs.isi,'UniformOutput',false);
questions.rs.isi = cat(1,questions.rs.isi{:});

% shuffle
questions.rs = struct_sort(questions.rs);

% clean
clear rs;
