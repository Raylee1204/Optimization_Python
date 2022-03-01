%最佳化第一次作業 分小團體
x = 1;
while(x)%輸入人口數
    number = input('請輸入人數(整數)：');%輸入人數
    if(number == fix(number) && number>0 )%檢查是否為正整數
        x = 0;
    else
        disp('！！！！請輸入正整數！！！！');%如果不是則持續迴圈
        disp('--------------------------')
    end
end
x = 1;
while(x)%依序填入最好朋友名單
    disp('請依序輸入對應號碼的最好朋友！');
    disp('左右須加上[ ]並且用空白隔開');
    BF = input('：');%輸入對應的好朋友
    if(BF == fix(BF))%檢查是否皆為整數
        if(length(BF)==number)%檢查是否長度相同
            if(all(BF<=number-1)&&all(BF>=0))%檢查是否有亂填數字
                if(length(BF)==length(unique(BF)))%檢查是否有重複數字
                    x = 0;
                else
                    disp('此數組中有重複數字');
                    disp('--------------------------')
                end
            else
                disp('此數組中有數字並不包含在範圍內');
                disp('------------------------------')
            end
        else
            disp('！！請數組超過數量！！');
            disp('--------------------------')
        end
    else
        disp('此數組中有非整數');
        disp('--------------------------')
    end
end
team = group(BF);%帶入下方函式
function team = group(y)%分小團體
    Own=(0:length(y)-1); 
    Track = zeros(1,length(y));%追蹤
    team = 0;%幾個隊
    for i = 1:length(y)
        if Track(i) == 0
            if (Own(i)==y(i))
                team = team+1;
                Track(i) = team;
            else
                team = team+1;
                Track(i) = team;
                temp = y(i);
                x = 1; 
                while(x)
                    Track(temp+1) = team;
                    if(y(temp+1)==Own(i))
                        x = 0;
                    else
                        temp = y(temp+1);
                    end


                end
            end
        end
    end
    fprintf('------------解答--------------\n')
    fprintf('總共有 %d 個小團體\n',team)
    fprintf('------------詳解--------------\n')
    for i = 1:team
        search = Track == i;
        member = Own(search);
        fprintf('第 %d 小團體成員有：\n',i)
        disp(member);
    end
end










