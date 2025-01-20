BeginPackage["Beforerr`"];

safeSave::usage = "safeSave[name, expr] saves the file at path if it does not already exist";

saveP[name_, p_, fmts_ : {".svg"}, dir_:"figures/"] :=
    Export[dir <> name <> #, p]& /@ fmts;

width1col = 3.25 * 72;
width2col = 6.5 * 72;

Options[safeSave] = {fmts -> {".svg"}, dir -> "figures/", imageSize -> width1col};
safeSaveP[path_?StringQ, expr_] :=
    If[!FileExistsQ[path],
        Export[path, expr]; Print["Saved to: ", path],
        Print["Already exists: ", path]
    ];

safeSave[name_, expr_, OptionsPattern[]] :=
    (safeSaveP[
        OptionValue[dir] <> name <> #, 
        Show[expr, ImageSize -> OptionValue[imageSize]]
    ]& /@ OptionValue[fmts]; expr)

saveName[c_] :=
    StringReplace[StringRiffle[ToString /@ c, "_"], " -> " -> "="]

posterShow[graphics_] := Show[graphics, LabelStyle -> {Larger}]

posterSave[name_, graphics_] := safeSave[name <> "_poster", posterShow[graphics]]

EndPackage[];
