function q_solutions = scara_inverse_kinematics(x_d)
% Return one row per elbow configuration for the pose [x; y; z; phi].

    a1 = 0.5;
    a2 = 0.5;
    d0 = 1.0;

    px = x_d(1);
    py = x_d(2);
    pz = x_d(3);
    phi = x_d(4);

    q_solutions = [];

    cos_q2 = (px^2 + py^2 - a1^2 - a2^2) / (2 * a1 * a2);

    % No solution outside the planar workspace.
    if abs(cos_q2) > 1
        q_solutions = [];
        return;
    end

    sin_q2_pos = sqrt(1 - cos_q2^2);

    q2_sol = [atan2(sin_q2_pos, cos_q2);
              atan2(-sin_q2_pos, cos_q2)];

    for i = 1:2
        q2 = q2_sol(i);

        den = px^2 + py^2;
        if den < 1e-12
            q1 = 0; % At the folded origin, any shoulder angle gives the same planar position.
        else
            s1 = ((a1 + a2*cos(q2))*py - a2*sin(q2)*px) / den;
            c1 = ((a1 + a2*cos(q2))*px + a2*sin(q2)*py) / den;
            q1 = atan2(s1, c1);
        end

        d3 = d0 - pz;

        q4 = q1 + q2 - phi;

        q_solutions(i, :) = [q1, q2, d3, q4];
    end
end
