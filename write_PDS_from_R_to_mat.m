clear all; clc;
main_path='D:\Miltiscale_shrec_ICCV_2017\MOCAP_PCA_scalar\MoCap_attractors\persistence_diagrams_from_phase_space_downsampled\';
d=dir(main_path);d(1:2)=[];
cd(main_path);
names=sort_nat({d.name}');
for i=1:length(names)
    cd(names{i});
    djoints=dir('*joint-*');
    names_joints=sort_nat({djoints.name}');
    for j=1:length(djoints)
        load(names_joints{j});
        x=pd;
         idx=find(x(:,1));
        h1=x(idx,:,:);
        h0=x(1:idx-1,:,:);
        PD{i,1}{j,1}=h0(:,2:3);
        PD{i,2}{j,1}=h1(:,2:3);
        
    
    end
        
        

    
    
    
    
    
    cd(main_path);
end

    
    