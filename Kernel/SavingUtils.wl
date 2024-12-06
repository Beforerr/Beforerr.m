BeginPackage["Beforerr`"];

safeSave::usage = "safeSave[path] saves the file at path if it does not already exist";

saveP[name_, p_, fmts_ : {".svg"}, dir_:"figures/"] :=
    Export[dir <> name <> #, p]& /@ fmts;

Options[safeSave] = {fmts -> {".svg"}, dir -> "figures/"};

safeSaveP[path_?StringQ, expr_] :=
    If[!FileExistsQ[path],
        Export[path, expr],
        Print["Saved to: ", path]
    ];

safeSave[name_, p_, OptionsPattern[]] :=
    safeSaveP[OptionValue[dir] <> name <> #, p]& /@ OptionValue[fmts];

saveName[c_] :=
    StringReplace[StringRiffle[ToString /@ c, "_"], " -> " -> "="]

posterShow[graphics_] := Show[graphics, LabelStyle -> {Larger}]

posterSave[name_, graphics_] := safeSave[name <> "_poster", posterShow[graphics]]

EndPackage[];
