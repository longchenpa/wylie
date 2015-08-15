-module(wylie).
-author("རྣམ་དག་སྟོན་པ").
-copyright("ཀློང་ཆེན་སྙིང་ཐིག").
-compile(export_all).

% Extended Wylie Tibetan Script EWTS UTF-8 Converter

constants() -> [
{"kh",{16#0f41,16#0f91}},
{"k",{16#0f40,16#0f90}},
{"g",{16#0f42,16#0f92}},
{"gh",{[16#0f42,16#0fb7],[16#0f92,16#0fb7]}},
{"g+h",{[16#0f42,16#0fb7],[16#0f92,16#0fb7]}},
{"ng",{16#0f44,16#0f94}},
{"c",{16#0f45,16#0f95}},
{"ch",{16#0f46,16#0f96}},
{"j",{16#0f47,16#0f97}},
{"ny",{16#0f49,16#0f99}},
{"T",{16#0f4a,16#0f9a}},
{"-t",{16#0f4a,16#0f9a}},
{"Th",{16#0f4b,16#0f9b}},
{"-th",{16#0f4b,16#0f9b}},
{"D",{16#0f4c,16#0f9c}},
{"-d",{16#0f4c,16#0f9c}},
{"Dh",{[16#0f4c,16#0fb7],[16#0f9c,16#0fb7]}},
{"D+h",{[16#0f4c,16#0fb7],[16#0f9c,16#0fb7]}},
{"-dh",{[16#0f4c,16#0fb7],[16#0f9c,16#0fb7]}},
{"-d+h",{[16#0f4c,16#0fb7],[16#0f9c,16#0fb7]}},
{"N",{16#0f4e,16#0f9e}},
{"-n",{16#0f4e,16#0f9e}},
{"t",{16#0f4f,16#0f9f}},
{"th",{16#0f50,16#0fa0}},
{"d",{16#0f51,16#0fa1}},
{"dh",{[16#0f51,16#0fb7],[16#0fa1,16#0fb7]}},
{"d+h",{[16#0f51,16#0fb7],[16#0fa1,16#0fb7]}},
{"n",{16#0f53,16#0fa3}},
{"p",{16#0f54,16#0fa4}},
{"ph",{16#0f55,16#0fa5}},
{"b",{16#0f56,16#0fa6}},
{"bh",{[16#0f56,16#0fb7],[16#0fa6,16#0fb7]}},
{"b+h",{[16#0f56,16#0fb7],[16#0fa6,16#0fb7]}},
{"m",{16#0f58,16#0fa8}},
{"ts",{16#0f59,16#0fa9}},
{"tsh",{16#0f5a,16#0faa}},
{"dz",{16#0f5b,16#0fab}},
{"dzh",{[16#0f5b,16#0fb7],[16#0fab,16#0fb7]}},
{"dz+h",{[16#0f5b,16#0fb7],[16#0fab,16#0fb7]}},
{"w",{16#0f5d,16#0fad}},
{"zh",{16#0f5e,16#0fae}},
{"z",{16#0f5f,16#0faf}},
{"'",{16#0f60,16#0fb0}},
{[16#2018],{16#0f60,16#0fb0}}, % typographic quotes
{[16#2019],{16#0f60,16#0fb0}},
{"y",{16#0f61,16#0fb1}},
{"r",{16#0f62,16#0fb2}},
{"l",{16#0f63,16#0fb3}},
{"sh",{16#0f64,16#0fb4}},
{"Sh",{16#0f65,16#0fb5}},
{"-sh",{16#0f65,16#0fb5}},
{"s",{16#0f66,16#0fb6}},
{"h",{16#0f67,16#0fb7}},
{"W",{16#0f5d,16#0fba}},
{"Y",{16#0f61,16#0fbb}},
{"R",{16#0f6a,16#0fbc}},
{"f",{[16#0f55,16#0f39],unknown}},
{"v",{[16#0f56,16#0f39],unknown}}].

vowels() -> [
{"a",16#0F68}, % a-chen
{"A",16#0f71},
{"i",16#0f72},
{"I",[16#0f71,16#0f72]},
{"u",16#0f74},
{"U",[16#0f71,16#0f74]},
{"e",16#0f7a},
{"ai",16#0f7b},
{"o",16#0f7c},
{"au",16#0f7d},
{"-i",16#0f80},
{"-I",[16#0f71,16#0f80]}].

sanskrit_vowels() -> [
{"r-i",[16#0fb2,16#0f80]},
{"r-I",[16#0fb2,16#0f71,16#0f80]},
{"l-i",[16#0fb3,16#0f80]},
{"l-I",[16#0fb3,16#0f71,16#0f80]}].

complex_vowels() -> [
{"r-i",{[16#0f62,16#0f80],[16#0fb2,16#0f80]}},
{"r-I",{[16#0f62,16#0f71,16#0f80],[16#0fb2,16#0f71,16#0f80]}}, 
{"l-i",{[16#0f63,16#0f80],[16#0fb3,16#0f80]}},
{"l-I",{[16#0f63,16#0f71,16#0f80],[16#0fb3,16#0f71,16#0f80]}}].

final() -> [
{"M",16#0f7e}, % anusvara / bindu / circle above / nga ro
{"H",16#0f7f}, % visarga / rnam bcad
{"~M`",16#0f82}, % crescent, bindu & nada
{"~M",16#0f83}, % crescent & bindu
{"?",16#0f84}, % halanta / srog med
{"X",16#0f37}, % small circle under
{"~X",16#0f35}, % small circle w/ crescent under
{"^",16#0f39}]. % tsa-phru

other() -> [
{"0",16#0f20},
{"1",16#0f21},
{"2",16#0f22},
{"3",16#0f23},
{"4",16#0f24},
{"5",16#0f25},
{"6",16#0f26},
{"7",16#0f27},
{"8",16#0f28},
{"9",16#0f29},
{" ",16#0f0b},
{"*",16#0f0c},
{"/",16#0f0d},
{"//",16#0f0e},
{";",16#0f0f},
{"|",16#0f11},
{"!",16#0f08},
{":",16#0f14},
{"+",""},
{"_"," "},
{"=",16#0f34},
{"<",16#0f3a},
{">",16#0f3b},
{"(",16#0f3c},
{")",16#0f3d},
{"@",16#0f04},
{"#",16#0f05},
{"$",16#0f06},
{"%",16#0f07}].

transcode({wylie,Text}) ->
    Table = lists:flatten([
        constants(),vowels(),sanskrit_vowels(),complex_vowels(),final(),other()]),
    Res = lists:reverse(t(4,Text,Table,[],0)),
    lists:flatten(Res).

%   io:format("N: ~p S: ~p P: ~p R: ~p~n",[N,String,P,R]),

t(0,String,Dictionary,Letters,_) -> t(4,tl(String),Dictionary,[hd(String)|Letters],0);
t(_,[],_,L,_) -> L;
t(N,String,Dictionary,Letters,P) when P > 4 -> t(N,String,Dictionary,Letters,0); % clear stack
t(N,String,Dictionary,Letters,P) ->
    R = lists:keyfind(lists:sublist(String,N),1,Dictionary),
    case R of
        {Key,Value} ->
            Vowel = is_vowel(Key),
            {Letter,Stack} = case Value of
                Value when Value == 16#0f0b -> {Value,5};
                {A,B} -> case P of 0 -> {[A],P+1}; _ -> {[B],P+1} end;
                Value when Key == "_" -> {[Value],P};
                Value when is_integer(Value) ->
                      case Key of "a"   when P == 0 andalso Vowel -> {[Value],P};
                                  _____ when P == 0 andalso Vowel -> {[16#0F68,Value],P+1};
                                  Value when P == 0 -> {[Value],P+1};
                                  "a"   -> {[],5};
                                  _____ -> {[Value],5} end;
                Value when is_list(Value) -> {Value,P+1}
            end,
            case length(String) > N of
                false -> [Letter|Letters];
                true -> t(4,lists:sublist(String,N+1,length(String)),
                            Dictionary,[Letter|Letters],Stack) end;
        false -> t(N-1,String,Dictionary,Letters,P) end.

tests() ->
    "ཨོཾ་ཨཱཿ་ཧཱུྃ"      = tibetan("oM AH hU~M"),
    "ཀློང་ཆེན་སྙིང་ཐིག" = tibetan("klong chen snying thig"),
    "རྣམ་དག་སྟོན་པ"     = tibetan("rnam dag ston pa"),
    "ཨོཾ་ཨརྒྷཾ་པདྱཾ་པུཥྤེ་དྷུཔྤེ་ཨ་ལོ་ཀེ་གནྡྷེ་ནཻ་ཝིཏྱེ་ཤབྟ་པྲ་ཏིཙྪ་ཡེ་སྭཱ་ཧཱ༔" =
        wylie:tibetan("oM ar+g+haM pad+yaM puSh+pe d+hup+pe a lo ke gan+d+he nai wit+ye shab+ta pra tits+tsha ye swA hA:"),
    "ཏདྱ་ཐཱ༔ ཨོཾ་མུ་ནེ་མུ་ནེ་མ་ཧཱ་མུ་ནེ་ཤཱཀྱ་མུ་ནེ་ཡེ་སྭཱ་ཧཱ༔" =
        wylie:tibetan("tad+ya thA:_oM mu ne mu ne ma hA mu ne shAkya mu ne ye swA hA:"),
    "བཛྲ་ས་མ་ཡཱ་ཛ༔ ཛ༔་ཧཱུྃ་བཾ་ཧོ༔ པདྨ་ཀ་མ་ལ་ཡེ་སྟྭཾ༔" =
        wylie:tibetan("badz+ra sa ma yA dza:_dza: hU~M baM ho:_pad+ma ka ma la ye stwaM:"),
    "ཨོཾ་ཡེ་དྷརྨཱ་ཧེ་ཏུ་པྲ་བྷ་ཝཱ་ཧེ་ཏུན་ཏེ་ཥནྟ་ཐཱ་ག་ཏོ་ཧྱ་ཝ་དཏ" =
        wylie:tibetan("oM ye d+har+mA he tu pra b+ha wA he tun te Shan+ta thA ga to ha+ya wa data"), ok.

tibetan(Wylie) ->
    transcode({wylie,Wylie}).

is_vowel(Char) -> lists:keyfind(Char,1,vowels()) /= false.

