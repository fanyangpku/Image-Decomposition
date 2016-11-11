function [ result ] = pulse_filter( img,up_scale)
    [m,n,c]=size(img);
    m_SR=m*up_scale;
    n_SR=n*up_scale;
    result=imresize(img,[m_SR n_SR],'bicubic');
    temp_SR_I_t=abs(result);
    win_size=9;
    half_win_size=floor(win_size/2);
    N_th=1.2;
    for row=1:m_SR
        for col=1:n_SR
            if row-half_win_size>0
                top=row-half_win_size;
            else
                top=1;
            end
        
            if row+half_win_size<=m_SR
                bottom=row+half_win_size;
            else
                bottom=m_SR;
            end
        
            if col-half_win_size>0
                left=col-half_win_size;
            else
                left=1;
            end
        
            if col+half_win_size<=n_SR
                right=col+half_win_size;
            else
                right=n_SR;
            end
        
            block=temp_SR_I_t(top:bottom,left:right);
            max_pulse=max(max(block));
            if max_pulse==0
                continue;
            end
            A=max_pulse^(1-N_th);
            X=result(row,col);
            result(row,col)=A*(temp_SR_I_t(row,col)^N_th)*sign(X);
        end
    end
end

