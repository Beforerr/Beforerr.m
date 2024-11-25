BeginPackage["Beforerr`"];

safeSave::usage = "safeSave[path] saves the file at path if it does not already exist";

saveP[name_, p_, fmts_ : {".svg"}, dir_:"figures/"] :=
    Export[dir <> name <> #, p]& /@ fmts;

Options[safeSave] = {fmts -> {".svg"}, dir -> "figures/"};

safeSave[path_?StringQ] :=
    If[!FileExistsQ[path],
        Export[path]
    ];

safeSave[name_, p_, OptionsPattern[]] :=
    safeSave[OptionValue[dir] <> name <> #, p]& /@ OptionValue[fmts];

saveName[c_] :=
    StringReplace[StringRiffle[ToString /@ c, "_"], " -> " -> "="]

EndPackage[];
