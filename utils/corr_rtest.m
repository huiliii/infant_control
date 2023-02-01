function [pf, z_signed] = corr_rtest(ra, rb, na, nb)
%[p, z, za, zb] = corr_rtest(ra, rb, na, nb)
%
% comparison of two correlation coefficients
% 
% input: ra, rb: r-values of correlation coefficient
%        na, nb: the number of datas
%
% ouput: p(1): pvalue of one-tailed test
%        p(2): pvalue of two-tailed test
%        za, zb: z transformed value of ra, rb


% take Fisher r to z transform

	za  = r2z(ra);
	zb  = r2z(rb);
% consider size effect 
	szab = sqrt(1/(na-3) + 1/(nb-3));
	z = abs(za-zb)/szab;
%   z = (za-zb)/szab;
% p: one-tailed, two-tailed
	p(1) = 1-normcdf(z, 0, 1);
	p(2) = 2*p(1);	
    pf = p(2);
    if pf > 0.1
        z = 0;
    end
% sign
    z_sign = sign(ra-rb);
    z_signed = z.*z_sign;
end

function zval = r2z(rval)
  zval = 0.5*log((1+rval)/(1-rval));
end