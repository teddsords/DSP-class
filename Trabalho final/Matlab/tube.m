function y = tube (x, gain, Q, dist, mix, rh, rl)
% escrever os comentarios se precisar

q = x * gain/max(abs(x));   % Normalization


if Q == 0
    z = q./(1 - exp(-dist * q));
    for i = 1 : length(q)   % Test because of the
        if q(i) == Q        % transfer function's
            z(i) = 1 / dist;% 0/0 vaue in Q
        end;
    end;
else
    z = (q - Q) ./ (1-exp(-dist * (q - Q))) + Q / (1 - exp(dist * Q));
    for i = 1 : length(q)
        if q(i) == Q
            z(i) = 1 / dist + Q / (1 - exp(dist * Q));
        end;
    end;
end;

y = mix * z * max(abs(x)) / max(abs(z)) + (1 - mix) * x;
y = y * max(abs(x)) / max(abs(y));
y = filter([1 -2 1], [1 -2*rh rh^2], y);
y = filter([1-rl], [1 -rl], y);