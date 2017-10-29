
questions = struct();

%% valid-invalid
vi = [ 1, 5,10; 1, 6,11; 1, 6,12; 4, 6, 9; 4, 6,10; 4, 7,11; 2, 7, 9; 2, 8,11; 2, 8,12; 3, 8, 9; 3, 8,10; 3, 5,12;11, 5,10; 1, 6, 8; 1, 4,12; 4,10, 9; 4, 6, 2; 8, 7,11;11, 7, 9; 2, 8, 6; 2, 3,12; 3,10, 9; 3, 8, 1; 6, 5,12];

questions.vi.image = repmat(vi,[2,1]);
questions.vi.valid = repmat([ones(12,1);zeros(12,1)],[2,1]);
questions.vi.day   = repmat([1,2],[24,1]);
questions.vi.day   = questions.vi.day(:);

% permute across samples/probe
vi = cellfun(@(i) questions.vi.image(:,i),{[1,2,3],[2,3,1],[3,1,2]},'UniformOutput',false);
questions.vi.image = cat(1,vi{:});
questions.vi.level = ceil(questions.vi.image/4);
questions.vi.valid = repmat(questions.vi.valid,[3,1]);
questions.vi.day   = repmat(questions.vi.day,  [3,1]);

% day per dimeninsion
questions.vi.day   = repmat(questions.vi.day,  [1,3]);

% shuffle
questions.vi = struct_filter(questions.vi, randperm(144));

% isi
questions.vi.isi = unifrnd(parameters.time_vi_isimin,parameters.time_vi_isimax,[parameters.task_nbtrials_vi,sum(strcmp(parameters.task_sessions,'vi'))]);
questions.vi.isi = questions.vi.isi ./ repmat(sum(questions.vi.isi,1), [size(questions.vi.isi,1),1]);
questions.vi.isi = questions.vi.isi .* mean([parameters.time_vi_isimin,parameters.time_vi_isimax]) .* parameters.task_nbtrials_vi;
questions.vi.isi = nan2zero(mat2vec(questions.vi.isi));

% sort
questions.vi = struct_sort(questions.vi);

% how to re-compute [valid]
% % questions.vi.valid = all(cell2mat(cellfun(@sort,mat2cell(ceil(questions.vi.image / 4),ones(144,1),3),'unif',0)) == [1,2,3],2);

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

% match
questions.rs.match = (questions.rs.day(:,1) == questions.rs.day(:,2));

% shuffle
questions.rs = struct_filter(questions.rs, randperm(432));

% isi
questions.rs.isi = unifrnd(parameters.time_rs_isimin,parameters.time_rs_isimax,[parameters.task_nbtrials_rs,sum(strcmp(parameters.task_sessions,'rs'))]);
questions.rs.isi = questions.rs.isi ./ repmat(sum(questions.rs.isi,1), [size(questions.rs.isi,1),1]);
questions.rs.isi = questions.rs.isi .* mean([parameters.time_rs_isimin,parameters.time_rs_isimax]) .* parameters.task_nbtrials_rs;
questions.rs.isi = nan2zero(mat2vec(questions.rs.isi));

% shuffle
questions.rs = struct_sort(questions.rs);

% clean
clear rs;
