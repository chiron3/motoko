/*
This can be read as literate Haskell (temporarily `ln ../test/run/small-pow.as ../test/run/small-pow.lhs`)

> import Data.Bits
> import Data.Word
>
> effbits :: FiniteBits a => a -> Int
> effbits a = finiteBitSize a - countLeadingZeros (a `xor` (a `shiftL` 1))
>
> extremal :: FiniteBits a => Int -> [a]
> extremal 0 = [zeroBits]
> extremal 1 = [complement zeroBits]
> extremal n = [complement zeroBits `shiftL` pred n, let max = complement zeroBits `shiftR` (finiteBitSize max - pred n) in max]
>
> asBigNum :: (Integral a, FiniteBits a) => a -> Integer
> asBigNum a | a `testBit` 63 = - fromIntegral (complement a) - 1
> asBigNum a = fromIntegral a
>
> showBig = show . asBigNum
>
> main = sequence_ [ putStrLn ("assert (" ++ showBig n ++ " ** " ++ show e ++ " == " ++ show n' ++ ");")
>                  | b <- [0 .. 31], e <- [0 .. 31], b * e <= 65, n <- extremal b :: [Word64]
>                  , let n' = asBigNum n ^ fromIntegral e ]

*/

assert (0 ** 0 == 1);
assert (0 ** 1 == 0);
assert (0 ** 2 == 0);
assert (0 ** 3 == 0);
assert (0 ** 4 == 0);
assert (0 ** 5 == 0);
assert (0 ** 6 == 0);
assert (0 ** 7 == 0);
assert (0 ** 8 == 0);
assert (0 ** 9 == 0);
assert (0 ** 10 == 0);
assert (0 ** 11 == 0);
assert (0 ** 12 == 0);
assert (0 ** 13 == 0);
assert (0 ** 14 == 0);
assert (0 ** 15 == 0);
assert (0 ** 16 == 0);
assert (0 ** 17 == 0);
assert (0 ** 18 == 0);
assert (0 ** 19 == 0);
assert (0 ** 20 == 0);
assert (0 ** 21 == 0);
assert (0 ** 22 == 0);
assert (0 ** 23 == 0);
assert (0 ** 24 == 0);
assert (0 ** 25 == 0);
assert (0 ** 26 == 0);
assert (0 ** 27 == 0);
assert (0 ** 28 == 0);
assert (0 ** 29 == 0);
assert (0 ** 30 == 0);
assert (0 ** 31 == 0);
assert (-1 ** 0 == 1);
assert (-1 ** 1 == -1);
assert (-1 ** 2 == 1);
assert (-1 ** 3 == -1);
assert (-1 ** 4 == 1);
assert (-1 ** 5 == -1);
assert (-1 ** 6 == 1);
assert (-1 ** 7 == -1);
assert (-1 ** 8 == 1);
assert (-1 ** 9 == -1);
assert (-1 ** 10 == 1);
assert (-1 ** 11 == -1);
assert (-1 ** 12 == 1);
assert (-1 ** 13 == -1);
assert (-1 ** 14 == 1);
assert (-1 ** 15 == -1);
assert (-1 ** 16 == 1);
assert (-1 ** 17 == -1);
assert (-1 ** 18 == 1);
assert (-1 ** 19 == -1);
assert (-1 ** 20 == 1);
assert (-1 ** 21 == -1);
assert (-1 ** 22 == 1);
assert (-1 ** 23 == -1);
assert (-1 ** 24 == 1);
assert (-1 ** 25 == -1);
assert (-1 ** 26 == 1);
assert (-1 ** 27 == -1);
assert (-1 ** 28 == 1);
assert (-1 ** 29 == -1);
assert (-1 ** 30 == 1);
assert (-1 ** 31 == -1);
assert (-2 ** 0 == 1);
assert (1 ** 0 == 1);
assert (-2 ** 1 == -2);
assert (1 ** 1 == 1);
assert (-2 ** 2 == 4);
assert (1 ** 2 == 1);
assert (-2 ** 3 == -8);
assert (1 ** 3 == 1);
assert (-2 ** 4 == 16);
assert (1 ** 4 == 1);
assert (-2 ** 5 == -32);
assert (1 ** 5 == 1);
assert (-2 ** 6 == 64);
assert (1 ** 6 == 1);
assert (-2 ** 7 == -128);
assert (1 ** 7 == 1);
assert (-2 ** 8 == 256);
assert (1 ** 8 == 1);
assert (-2 ** 9 == -512);
assert (1 ** 9 == 1);
assert (-2 ** 10 == 1024);
assert (1 ** 10 == 1);
assert (-2 ** 11 == -2048);
assert (1 ** 11 == 1);
assert (-2 ** 12 == 4096);
assert (1 ** 12 == 1);
assert (-2 ** 13 == -8192);
assert (1 ** 13 == 1);
assert (-2 ** 14 == 16384);
assert (1 ** 14 == 1);
assert (-2 ** 15 == -32768);
assert (1 ** 15 == 1);
assert (-2 ** 16 == 65536);
assert (1 ** 16 == 1);
assert (-2 ** 17 == -131072);
assert (1 ** 17 == 1);
assert (-2 ** 18 == 262144);
assert (1 ** 18 == 1);
assert (-2 ** 19 == -524288);
assert (1 ** 19 == 1);
assert (-2 ** 20 == 1048576);
assert (1 ** 20 == 1);
assert (-2 ** 21 == -2097152);
assert (1 ** 21 == 1);
assert (-2 ** 22 == 4194304);
assert (1 ** 22 == 1);
assert (-2 ** 23 == -8388608);
assert (1 ** 23 == 1);
assert (-2 ** 24 == 16777216);
assert (1 ** 24 == 1);
assert (-2 ** 25 == -33554432);
assert (1 ** 25 == 1);
assert (-2 ** 26 == 67108864);
assert (1 ** 26 == 1);
assert (-2 ** 27 == -134217728);
assert (1 ** 27 == 1);
assert (-2 ** 28 == 268435456);
assert (1 ** 28 == 1);
assert (-2 ** 29 == -536870912);
assert (1 ** 29 == 1);
assert (-2 ** 30 == 1073741824);
assert (1 ** 30 == 1);
assert (-2 ** 31 == -2147483648);
assert (1 ** 31 == 1);
assert (-4 ** 0 == 1);
assert (3 ** 0 == 1);
assert (-4 ** 1 == -4);
assert (3 ** 1 == 3);
assert (-4 ** 2 == 16);
assert (3 ** 2 == 9);
assert (-4 ** 3 == -64);
assert (3 ** 3 == 27);
assert (-4 ** 4 == 256);
assert (3 ** 4 == 81);
assert (-4 ** 5 == -1024);
assert (3 ** 5 == 243);
assert (-4 ** 6 == 4096);
assert (3 ** 6 == 729);
assert (-4 ** 7 == -16384);
assert (3 ** 7 == 2187);
assert (-4 ** 8 == 65536);
assert (3 ** 8 == 6561);
assert (-4 ** 9 == -262144);
assert (3 ** 9 == 19683);
assert (-4 ** 10 == 1048576);
assert (3 ** 10 == 59049);
assert (-4 ** 11 == -4194304);
assert (3 ** 11 == 177147);
assert (-4 ** 12 == 16777216);
assert (3 ** 12 == 531441);
assert (-4 ** 13 == -67108864);
assert (3 ** 13 == 1594323);
assert (-4 ** 14 == 268435456);
assert (3 ** 14 == 4782969);
assert (-4 ** 15 == -1073741824);
assert (3 ** 15 == 14348907);
assert (-4 ** 16 == 4294967296);
assert (3 ** 16 == 43046721);
assert (-4 ** 17 == -17179869184);
assert (3 ** 17 == 129140163);
assert (-4 ** 18 == 68719476736);
assert (3 ** 18 == 387420489);
assert (-4 ** 19 == -274877906944);
assert (3 ** 19 == 1162261467);
assert (-4 ** 20 == 1099511627776);
assert (3 ** 20 == 3486784401);
assert (-4 ** 21 == -4398046511104);
assert (3 ** 21 == 10460353203);
assert (-8 ** 0 == 1);
assert (7 ** 0 == 1);
assert (-8 ** 1 == -8);
assert (7 ** 1 == 7);
assert (-8 ** 2 == 64);
assert (7 ** 2 == 49);
assert (-8 ** 3 == -512);
assert (7 ** 3 == 343);
assert (-8 ** 4 == 4096);
assert (7 ** 4 == 2401);
assert (-8 ** 5 == -32768);
assert (7 ** 5 == 16807);
assert (-8 ** 6 == 262144);
assert (7 ** 6 == 117649);
assert (-8 ** 7 == -2097152);
assert (7 ** 7 == 823543);
assert (-8 ** 8 == 16777216);
assert (7 ** 8 == 5764801);
assert (-8 ** 9 == -134217728);
assert (7 ** 9 == 40353607);
assert (-8 ** 10 == 1073741824);
assert (7 ** 10 == 282475249);
assert (-8 ** 11 == -8589934592);
assert (7 ** 11 == 1977326743);
assert (-8 ** 12 == 68719476736);
assert (7 ** 12 == 13841287201);
assert (-8 ** 13 == -549755813888);
assert (7 ** 13 == 96889010407);
assert (-8 ** 14 == 4398046511104);
assert (7 ** 14 == 678223072849);
assert (-8 ** 15 == -35184372088832);
assert (7 ** 15 == 4747561509943);
assert (-8 ** 16 == 281474976710656);
assert (7 ** 16 == 33232930569601);
assert (-16 ** 0 == 1);
assert (15 ** 0 == 1);
assert (-16 ** 1 == -16);
assert (15 ** 1 == 15);
assert (-16 ** 2 == 256);
assert (15 ** 2 == 225);
assert (-16 ** 3 == -4096);
assert (15 ** 3 == 3375);
assert (-16 ** 4 == 65536);
assert (15 ** 4 == 50625);
assert (-16 ** 5 == -1048576);
assert (15 ** 5 == 759375);
assert (-16 ** 6 == 16777216);
assert (15 ** 6 == 11390625);
assert (-16 ** 7 == -268435456);
assert (15 ** 7 == 170859375);
assert (-16 ** 8 == 4294967296);
assert (15 ** 8 == 2562890625);
assert (-16 ** 9 == -68719476736);
assert (15 ** 9 == 38443359375);
assert (-16 ** 10 == 1099511627776);
assert (15 ** 10 == 576650390625);
assert (-16 ** 11 == -17592186044416);
assert (15 ** 11 == 8649755859375);
assert (-16 ** 12 == 281474976710656);
assert (15 ** 12 == 129746337890625);
assert (-16 ** 13 == -4503599627370496);
assert (15 ** 13 == 1946195068359375);
assert (-32 ** 0 == 1);
assert (31 ** 0 == 1);
assert (-32 ** 1 == -32);
assert (31 ** 1 == 31);
assert (-32 ** 2 == 1024);
assert (31 ** 2 == 961);
assert (-32 ** 3 == -32768);
assert (31 ** 3 == 29791);
assert (-32 ** 4 == 1048576);
assert (31 ** 4 == 923521);
assert (-32 ** 5 == -33554432);
assert (31 ** 5 == 28629151);
assert (-32 ** 6 == 1073741824);
assert (31 ** 6 == 887503681);
assert (-32 ** 7 == -34359738368);
assert (31 ** 7 == 27512614111);
assert (-32 ** 8 == 1099511627776);
assert (31 ** 8 == 852891037441);
assert (-32 ** 9 == -35184372088832);
assert (31 ** 9 == 26439622160671);
assert (-32 ** 10 == 1125899906842624);
assert (31 ** 10 == 819628286980801);
assert (-64 ** 0 == 1);
assert (63 ** 0 == 1);
assert (-64 ** 1 == -64);
assert (63 ** 1 == 63);
assert (-64 ** 2 == 4096);
assert (63 ** 2 == 3969);
assert (-64 ** 3 == -262144);
assert (63 ** 3 == 250047);
assert (-64 ** 4 == 16777216);
assert (63 ** 4 == 15752961);
assert (-64 ** 5 == -1073741824);
assert (63 ** 5 == 992436543);
assert (-64 ** 6 == 68719476736);
assert (63 ** 6 == 62523502209);
assert (-64 ** 7 == -4398046511104);
assert (63 ** 7 == 3938980639167);
assert (-64 ** 8 == 281474976710656);
assert (63 ** 8 == 248155780267521);
assert (-64 ** 9 == -18014398509481984);
assert (63 ** 9 == 15633814156853823);
assert (-128 ** 0 == 1);
assert (127 ** 0 == 1);
assert (-128 ** 1 == -128);
assert (127 ** 1 == 127);
assert (-128 ** 2 == 16384);
assert (127 ** 2 == 16129);
assert (-128 ** 3 == -2097152);
assert (127 ** 3 == 2048383);
assert (-128 ** 4 == 268435456);
assert (127 ** 4 == 260144641);
assert (-128 ** 5 == -34359738368);
assert (127 ** 5 == 33038369407);
assert (-128 ** 6 == 4398046511104);
assert (127 ** 6 == 4195872914689);
assert (-128 ** 7 == -562949953421312);
assert (127 ** 7 == 532875860165503);
assert (-128 ** 8 == 72057594037927936);
assert (127 ** 8 == 67675234241018881);
assert (-256 ** 0 == 1);
assert (255 ** 0 == 1);
assert (-256 ** 1 == -256);
assert (255 ** 1 == 255);
assert (-256 ** 2 == 65536);
assert (255 ** 2 == 65025);
assert (-256 ** 3 == -16777216);
assert (255 ** 3 == 16581375);
assert (-256 ** 4 == 4294967296);
assert (255 ** 4 == 4228250625);
assert (-256 ** 5 == -1099511627776);
assert (255 ** 5 == 1078203909375);
assert (-256 ** 6 == 281474976710656);
assert (255 ** 6 == 274941996890625);
assert (-256 ** 7 == -72057594037927936);
assert (255 ** 7 == 70110209207109375);
assert (-512 ** 0 == 1);
assert (511 ** 0 == 1);
assert (-512 ** 1 == -512);
assert (511 ** 1 == 511);
assert (-512 ** 2 == 262144);
assert (511 ** 2 == 261121);
assert (-512 ** 3 == -134217728);
assert (511 ** 3 == 133432831);
assert (-512 ** 4 == 68719476736);
assert (511 ** 4 == 68184176641);
assert (-512 ** 5 == -35184372088832);
assert (511 ** 5 == 34842114263551);
assert (-512 ** 6 == 18014398509481984);
assert (511 ** 6 == 17804320388674561);
assert (-1024 ** 0 == 1);
assert (1023 ** 0 == 1);
assert (-1024 ** 1 == -1024);
assert (1023 ** 1 == 1023);
assert (-1024 ** 2 == 1048576);
assert (1023 ** 2 == 1046529);
assert (-1024 ** 3 == -1073741824);
assert (1023 ** 3 == 1070599167);
assert (-1024 ** 4 == 1099511627776);
assert (1023 ** 4 == 1095222947841);
assert (-1024 ** 5 == -1125899906842624);
assert (1023 ** 5 == 1120413075641343);
assert (-2048 ** 0 == 1);
assert (2047 ** 0 == 1);
assert (-2048 ** 1 == -2048);
assert (2047 ** 1 == 2047);
assert (-2048 ** 2 == 4194304);
assert (2047 ** 2 == 4190209);
assert (-2048 ** 3 == -8589934592);
assert (2047 ** 3 == 8577357823);
assert (-2048 ** 4 == 17592186044416);
assert (2047 ** 4 == 17557851463681);
assert (-2048 ** 5 == -36028797018963968);
assert (2047 ** 5 == 35940921946155007);
assert (-4096 ** 0 == 1);
assert (4095 ** 0 == 1);
assert (-4096 ** 1 == -4096);
assert (4095 ** 1 == 4095);
assert (-4096 ** 2 == 16777216);
assert (4095 ** 2 == 16769025);
assert (-4096 ** 3 == -68719476736);
assert (4095 ** 3 == 68669157375);
assert (-4096 ** 4 == 281474976710656);
assert (4095 ** 4 == 281200199450625);
assert (-4096 ** 5 == -1152921504606846976);
assert (4095 ** 5 == 1151514816750309375);
assert (-8192 ** 0 == 1);
assert (8191 ** 0 == 1);
assert (-8192 ** 1 == -8192);
assert (8191 ** 1 == 8191);
assert (-8192 ** 2 == 67108864);
assert (8191 ** 2 == 67092481);
assert (-8192 ** 3 == -549755813888);
assert (8191 ** 3 == 549554511871);
assert (-8192 ** 4 == 4503599627370496);
assert (8191 ** 4 == 4501401006735361);
assert (-16384 ** 0 == 1);
assert (16383 ** 0 == 1);
assert (-16384 ** 1 == -16384);
assert (16383 ** 1 == 16383);
assert (-16384 ** 2 == 268435456);
assert (16383 ** 2 == 268402689);
assert (-16384 ** 3 == -4398046511104);
assert (16383 ** 3 == 4397241253887);
assert (-16384 ** 4 == 72057594037927936);
assert (16383 ** 4 == 72040003462430721);
assert (-32768 ** 0 == 1);
assert (32767 ** 0 == 1);
assert (-32768 ** 1 == -32768);
assert (32767 ** 1 == 32767);
assert (-32768 ** 2 == 1073741824);
assert (32767 ** 2 == 1073676289);
assert (-32768 ** 3 == -35184372088832);
assert (32767 ** 3 == 35181150961663);
assert (-32768 ** 4 == 1152921504606846976);
assert (32767 ** 4 == 1152780773560811521);
assert (-65536 ** 0 == 1);
assert (65535 ** 0 == 1);
assert (-65536 ** 1 == -65536);
assert (65535 ** 1 == 65535);
assert (-65536 ** 2 == 4294967296);
assert (65535 ** 2 == 4294836225);
assert (-65536 ** 3 == -281474976710656);
assert (65535 ** 3 == 281462092005375);
assert (-131072 ** 0 == 1);
assert (131071 ** 0 == 1);
assert (-131072 ** 1 == -131072);
assert (131071 ** 1 == 131071);
assert (-131072 ** 2 == 17179869184);
assert (131071 ** 2 == 17179607041);
assert (-131072 ** 3 == -2251799813685248);
assert (131071 ** 3 == 2251748274470911);
assert (-262144 ** 0 == 1);
assert (262143 ** 0 == 1);
assert (-262144 ** 1 == -262144);
assert (262143 ** 1 == 262143);
assert (-262144 ** 2 == 68719476736);
assert (262143 ** 2 == 68718952449);
assert (-262144 ** 3 == -18014398509481984);
assert (262143 ** 3 == 18014192351838207);
assert (-524288 ** 0 == 1);
assert (524287 ** 0 == 1);
assert (-524288 ** 1 == -524288);
assert (524287 ** 1 == 524287);
assert (-524288 ** 2 == 274877906944);
assert (524287 ** 2 == 274876858369);
assert (-524288 ** 3 == -144115188075855872);
assert (524287 ** 3 == 144114363443707903);
assert (-1048576 ** 0 == 1);
assert (1048575 ** 0 == 1);
assert (-1048576 ** 1 == -1048576);
assert (1048575 ** 1 == 1048575);
assert (-1048576 ** 2 == 1099511627776);
assert (1048575 ** 2 == 1099509530625);
assert (-1048576 ** 3 == -1152921504606846976);
assert (1048575 ** 3 == 1152918206075109375);
assert (-2097152 ** 0 == 1);
assert (2097151 ** 0 == 1);
assert (-2097152 ** 1 == -2097152);
assert (2097151 ** 1 == 2097151);
assert (-2097152 ** 2 == 4398046511104);
assert (2097151 ** 2 == 4398042316801);
assert (-4194304 ** 0 == 1);
assert (4194303 ** 0 == 1);
assert (-4194304 ** 1 == -4194304);
assert (4194303 ** 1 == 4194303);
assert (-4194304 ** 2 == 17592186044416);
assert (4194303 ** 2 == 17592177655809);
assert (-8388608 ** 0 == 1);
assert (8388607 ** 0 == 1);
assert (-8388608 ** 1 == -8388608);
assert (8388607 ** 1 == 8388607);
assert (-8388608 ** 2 == 70368744177664);
assert (8388607 ** 2 == 70368727400449);
assert (-16777216 ** 0 == 1);
assert (16777215 ** 0 == 1);
assert (-16777216 ** 1 == -16777216);
assert (16777215 ** 1 == 16777215);
assert (-16777216 ** 2 == 281474976710656);
assert (16777215 ** 2 == 281474943156225);
assert (-33554432 ** 0 == 1);
assert (33554431 ** 0 == 1);
assert (-33554432 ** 1 == -33554432);
assert (33554431 ** 1 == 33554431);
assert (-33554432 ** 2 == 1125899906842624);
assert (33554431 ** 2 == 1125899839733761);
assert (-67108864 ** 0 == 1);
assert (67108863 ** 0 == 1);
assert (-67108864 ** 1 == -67108864);
assert (67108863 ** 1 == 67108863);
assert (-67108864 ** 2 == 4503599627370496);
assert (67108863 ** 2 == 4503599493152769);
assert (-134217728 ** 0 == 1);
assert (134217727 ** 0 == 1);
assert (-134217728 ** 1 == -134217728);
assert (134217727 ** 1 == 134217727);
assert (-134217728 ** 2 == 18014398509481984);
assert (134217727 ** 2 == 18014398241046529);
assert (-268435456 ** 0 == 1);
assert (268435455 ** 0 == 1);
assert (-268435456 ** 1 == -268435456);
assert (268435455 ** 1 == 268435455);
assert (-268435456 ** 2 == 72057594037927936);
assert (268435455 ** 2 == 72057593501057025);
assert (-536870912 ** 0 == 1);
assert (536870911 ** 0 == 1);
assert (-536870912 ** 1 == -536870912);
assert (536870911 ** 1 == 536870911);
assert (-536870912 ** 2 == 288230376151711744);
assert (536870911 ** 2 == 288230375077969921);
assert (-1073741824 ** 0 == 1);
assert (1073741823 ** 0 == 1);
assert (-1073741824 ** 1 == -1073741824);
assert (1073741823 ** 1 == 1073741823);
assert (-1073741824 ** 2 == 1152921504606846976);
assert (1073741823 ** 2 == 1152921502459363329);