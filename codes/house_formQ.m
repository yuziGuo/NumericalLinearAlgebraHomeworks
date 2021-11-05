
function [Q] = formQ(W)
    [m, m] = size(W)
    QT = eye(m)
    for k=1:n
        vk = W(:,k)
        % REDO the functions A
        QT = QT - 2*vk*(vk'*QT)  
    end
    Q = QT.'
end