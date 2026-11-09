function scara_robot_plot_3D(theta1, theta2, d3, theta4,P)
% Draw the SCARA configuration and reference path in 3D.
theta1=theta1*180/pi;
theta2=theta2*180/pi;
theta4=theta4*180/pi;
    L1 = 0.5;
    L2 = 0.5;
    d1 = 1;

    T1 = [cosd(theta1), -sind(theta1), 0, L1*cosd(theta1);
          sind(theta1),  cosd(theta1), 0, L1*sind(theta1);
          0,             0,            1, d1;
          0,             0,            0, 1];

    T2 = [cosd(theta2), -sind(theta2), 0, L2*cosd(theta2);
          sind(theta2),  cosd(theta2), 0, L2*sind(theta2);
          0,             0,            1, 0;
          0,             0,            0, 1];

    T3 = [1, 0, 0, 0;
          0, 1, 0, 0;
          0, 0, 1, d3;
          0, 0, 0, 1];

    T4 = [cosd(theta4), -sind(theta4), 0, 0;
          sind(theta4),  cosd(theta4), 0, 0;
          0,             0,            1, 0;
          0,             0,            0, 1];

 % Compose the joint transforms.
    T = T1 * T2 * T3 * T4;

    base = [0, 0, d1];

    link1_end = T1(1:3, 4)';

    T12 = T1 * T2;

    link2_end = T12(1:3, 4)';

    end_effector = T(1:3, 4)';

    figure;
    hold on;
    view(3);

    % Draw the links from their joint positions.
    plot3([0, base(1)], [0, base(2)], [0, base(3)], 'c', 'LineWidth', 20);
    plot3([base(1), link1_end(1)], [base(2), link1_end(2)], [base(3), link1_end(3)], 'c', 'LineWidth', 10);
    plot3([link1_end(1), link2_end(1)], [link1_end(2), link2_end(2)], [link1_end(3), link2_end(3)], 'c', 'LineWidth', 10);
    plot3([link2_end(1), end_effector(1)], [link2_end(2), end_effector(2)], [link2_end(3), end_effector(3)], 'c', 'LineWidth', 7);

    plot3(base(1), base(2), base(3), 'ko', 'MarkerSize', 20, 'MarkerFaceColor', 'c');
    plot3(link1_end(1), link1_end(2), link1_end(3), 'ko', 'MarkerSize', 20, 'MarkerFaceColor', 'c');
    plot3(link2_end(1), link2_end(2), link2_end(3), 'ko', 'MarkerSize', 20, 'MarkerFaceColor', 'c');
    plot3(end_effector(1), end_effector(2), end_effector(3), 'ko', 'MarkerSize', 20, 'MarkerFaceColor', 'r');

a = 0.3;

vertices = [-a/2 -a/2 -a/2;  a/2 -a/2 -a/2;  a/2  a/2 -a/2; -a/2  a/2 -a/2; ...
            -a/2 -a/2  a/2;  a/2 -a/2  a/2;  a/2  a/2  a/2; -a/2  a/2  a/2];

faces = [1 2 3 4; 1 2 6 5; 2 3 7 6; ...
         3 4 8 7; 1 4 8 5; 5 6 7 8];

patch('Vertices', vertices, 'Faces', faces, 'FaceColor', 'magenta', 'EdgeColor', 'black');

    plot3(P(1,:), P(2,:), P(3,:), 'ko', 'MarkerSize', 1, 'MarkerFaceColor', 'g');

    xlabel('X');
    ylabel('Y');
    zlabel('Z');

    grid on;
    axis equal;
    title('SCARA Robot Model');

    xlim([-1, 1]);
    ylim([-1, 1]);
    zlim([-0.15, 1]);

    rotate3d on;

end
