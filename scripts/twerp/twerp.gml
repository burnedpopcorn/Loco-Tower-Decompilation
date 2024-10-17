function twerp(argument0, argument1, argument2, argument3, argument4, argument5) //twerp
{
    argument0 = clamp(argument0, 0, (31 << 0))
    argument3 = clamp(argument3, 0, 1)
    var _chng = (argument2 - argument1)
    var _mid = ((argument1 + argument2) / 2)
    switch argument0
    {
        case (0 << 0):
            return lerp(argument1, argument2, argument3);
        case (22 << 0):
            var _b = (argument4 == undefined ? 1.5 : argument4)
            return (argument3 < 0.5 ? twerp((23 << 0), argument1, _mid, (argument3 * 2), _b) : twerp((24 << 0), _mid, argument2, ((argument3 - 0.5) * 2), _b));
        case (23 << 0):
            _b = (argument4 == undefined ? 1.5 : argument4)
            return ((((_chng * argument3) * argument3) * (((_b + 1) * argument3) - _b)) + argument1);
        case (24 << 0):
            _b = (argument4 == undefined ? 1.5 : argument4)
            argument3 -= 1
            return ((_chng * (((argument3 * argument3) * (((_b + 1) * argument3) + _b)) + 1)) + argument1);
        case (25 << 0):
            return (argument3 < 0.5 ? twerp((27 << 0), argument1, ((argument1 + argument2) / 2), (argument3 * 2)) : twerp((26 << 0), ((argument1 + argument2) / 2), argument2, ((argument3 - 0.5) * 2)));
        case (26 << 0):
            if (argument3 < 0.36363636363636365)
                return ((_chng * ((7.5625 * argument3) * argument3)) + argument1);
            else if (argument3 < 0.7272727272727273)
            {
                argument3 -= 0.5454545454545454
                return ((_chng * (((7.5625 * argument3) * argument3) + 0.75)) + argument1);
            }
            else if (argument3 < 0.9090909090909091)
            {
                argument3 -= 0.8181818181818182
                return ((_chng * (((7.5625 * argument3) * argument3) + 0.9375)) + argument1);
            }
            argument3 -= 0.9545454545454546
            return ((_chng * (((7.5625 * argument3) * argument3) + 0.984375)) + argument1);
        case (27 << 0):
            _chng = (argument2 - argument3)
            argument3 = (1 - argument3)
            return ((_chng - twerp((26 << 0), argument1, argument2, argument3, 7.5625)) + argument1);
        case (13 << 0):
            return (argument3 < 0.5 ? twerp((15 << 0), argument1, _mid, (argument3 * 2)) : twerp((14 << 0), _mid, argument2, ((argument3 - 0.5) * 2)));
        case (14 << 0):
            argument3--
            return ((_chng * sqrt((1 - (argument3 * argument3)))) + argument1);
        case (15 << 0):
            return (((-_chng) * (sqrt((1 - (argument3 * argument3))) - 1)) + argument1);
        case (1 << 0):
            return (argument3 < 0.5 ? twerp((3 << 0), argument1, _mid, (argument3 * 2)) : twerp((2 << 0), _mid, argument2, ((argument3 - 0.5) * 2)));
        case (2 << 0):
            return ((_chng * (power((argument3 - 1), 3) + 1)) + argument1);
        case (3 << 0):
            return ((_chng * power(argument3, 3)) + argument1);
        case (28 << 0):
            var _e = (argument4 == undefined ? 0.3 : argument4)
            var _d = (argument5 == undefined ? 5 : argument5)
            return (argument3 < 0.5 ? twerp((30 << 0), argument1, _mid, (argument3 * 2), _e, _d) : twerp((29 << 0), _mid, argument2, ((argument3 - 0.5) * 2), _e, _d));
        case (29 << 0):
            _e = (argument4 == undefined ? 0.3 : argument4)
            _d = (argument5 == undefined ? 5 : argument5)
            if (argument3 == 0 || _chng == 0)
                return argument1;
            if (argument3 == 1)
            {
                argument1 = argument2
                return argument1;
            }
            var _p = (_d * _e)
            var _s = (sign(_chng) == -1 ? (_p * 0.25) : ((_p / (2 * pi)) * arcsin(1)))
            argument1 = ((((_chng * power(2, (-10 * argument3))) * sin(((((argument3 * _d) - _s) * (2 * pi)) / _p))) + _chng) + argument1)
            return argument1;
        case (30 << 0):
            _e = (argument4 == undefined ? 0.3 : argument4)
            _d = (argument5 == undefined ? 5 : argument5)
            if (argument3 == 0 || _chng == 0)
            {
                argument1 = argument1
                return argument1;
            }
            if (argument3 == 1)
            {
                argument1 = argument2
                return argument1;
            }
            _p = (_d * _e)
            _s = (sign(_chng) == -1 ? (_p * 0.25) : ((_p / (2 * pi)) * arcsin(1)))
            argument1 = ((-(((_chng * power(2, (10 * --argument3))) * sin(((((argument3 * _d) - _s) * (2 * pi)) / _p))))) + argument1)
            return argument1;
        case (19 << 0):
            argument1 = (argument3 < 0.5 ? twerp((21 << 0), argument1, _mid, (argument3 * 2)) : twerp((20 << 0), _mid, argument2, ((argument3 - 0.5) * 2)))
            return argument1;
        case (20 << 0):
            argument1 = ((_chng * ((-(power(2, (-10 * argument3)))) + 1)) + argument1)
            return argument1;
        case (21 << 0):
            argument1 = ((_chng * power(2, (10 * (argument3 - 1)))) + argument1)
            return argument1;
        case (4 << 0):
            argument1 = (argument3 < 0.5 ? twerp((6 << 0), argument1, _mid, (argument3 * 2)) : twerp((5 << 0), _mid, argument2, ((argument3 - 0.5) * 2)))
            return argument1;
        case (5 << 0):
            argument1 = ((((-_chng) * argument3) * (argument3 - 2)) + argument1)
            return argument1;
        case (6 << 0):
            argument1 = (((_chng * argument3) * argument3) + argument1)
            return argument1;
        case (7 << 0):
            argument1 = (argument3 < 0.5 ? twerp((9 << 0), argument1, _mid, (argument3 * 2)) : twerp((8 << 0), _mid, argument2, ((argument3 - 0.5) * 2)))
            return argument1;
        case (8 << 0):
            argument1 = (((-_chng) * (((((argument3 - 1) * (argument3 - 1)) * (argument3 - 1)) * (argument3 - 1)) - 1)) + argument1)
            return argument1;
        case (9 << 0):
            argument1 = ((_chng * (((argument3 * argument3) * argument3) * argument3)) + argument1)
            return argument1;
        case (10 << 0):
            argument1 = (argument3 < 0.5 ? twerp((12 << 0), argument1, _mid, (argument3 * 2)) : twerp((11 << 0), _mid, argument2, ((argument3 - 0.5) * 2)))
            return argument1;
        case (11 << 0):
            argument1 = ((_chng * ((((((argument3 - 1) * (argument3 - 1)) * (argument3 - 1)) * (argument3 - 1)) * (argument3 - 1)) + 1)) + argument1)
            return argument1;
        case (12 << 0):
            argument1 = ((((((_chng * argument3) * argument3) * argument3) * argument3) * argument3) + argument1)
            return argument1;
        case (16 << 0):
            argument1 = (((_chng * 0.5) * (1 - cos((pi * argument3)))) + argument1)
            return argument1;
        case (17 << 0):
            argument1 = ((_chng * sin((argument3 * 1.57079632679))) + argument1)
            return argument1;
        case (18 << 0):
            argument1 = ((_chng * (1 - cos((argument3 * 1.57079632679)))) + argument1)
            return argument1;
    }

}

