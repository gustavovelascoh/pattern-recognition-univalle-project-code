% import_dataset
function import_dataset(file)

%file = "lms3";

raw = [file ".raw"]
fid = fopen(raw);

ret = fread(fid,3,"float");

ang_rng = ret(1);
ang_res = ret(2);
unit = ret(3);

MAXDATLEN = ang_rng/ang_res + 1;

laser_data = [];
t = [];

count = 0;
idx = 1;

while 1
    [tt, count] = fread(fid,1,"int");
    
    if (count <= 0)
        break;
    end

    [ld, count] = fread(fid,MAXDATLEN,"unsigned short");

    t(:,idx) = tt;
    laser_data(:,idx) = ld;
    
    idx++;
    
end

th = 0:0.5:180;
th = th * pi/180;

bg_f =[file ".bg"] 

fid = fopen(bg_f);

[tt, count] = fread(fid,1,"int");
[bg_data, count] = fread(fid,MAXDATLEN,"unsigned short");

mat_file = [file ".mat"]
eval(["save " mat_file " laser_data bg_data th t"]);
