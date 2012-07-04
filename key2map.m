str_key=int2str(key);
str_key_neigh=int2str(key_neigh);

%test if key already present in hash. 
if hash.isKey(str_key)
    temp=hash(str_key);%get copy of array in hash by key
    found=find(temp(1,:)==key_neigh); %test if we already have key_neigh as neighbor to key (find it's place if found)
    if found
        temp(2,found)=temp(2,found)+1;%if we do - then increment the amount of bordering pixels
    else
        temp=[temp [key_neigh 1]'];%if not - create a new neighbor with 1 bordering pixel
    end
    hash(str_key)=temp;
else %if key is not found in hash
    hash(str_key)=[key_neigh,1]'; %create a new entry for neighbor with 1 bordering pixel
end

%same for neighboring key
if hash.isKey(str_key_neigh)
    temp=hash(str_key_neigh);%get copy of array in hash by key_neigh
    found=find(temp(1,:)==key); %test if we already have key as neighbor to key_neigh (find it's place if found)
    if found
        temp(2,found)=temp(2,found)+1;%if we do - then increment the amount of bordering pixels
    else
        temp=[temp [key 1]'];%if not - create a new neighbor with 1 bordering pixel
    end
    hash(str_key_neigh)=temp;
else %if key_neigh is not found in hash
    hash(str_key_neigh)=[key,1]'; %create a new entry for neighbor with 1 bordering pixel
end


