function phi = FPA(A)
	% Calculate flight path angle
	cosPhi = (1 + A(2) * cos(A(6)))/sqrt(1 + 2*A(2)*cos(A(6)) + A(2)^2);
	sinPhi = (A(2)*sin(A(6)))/sqrt(1 + 2*A(2)*cos(A(6)) + A(2)^2);
	phi = atan2(sinPhi,cosPhi);
end
