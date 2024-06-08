BeginPackage["Beforerr`"];

safeSave::usage = "safeSave[path] saves the file at path if it does not already exist";

saveP[name_, p_, fmts_ : {".svg"}, dir_:"figures/"] :=
    Export[dir <> name <> #, p]& /@ fmts;

safeSave[path_?StringQ] :=
    If[!FileExistsQ[path],
        Export[path]
    ];

safeSave[name_, p_, fmts_ : {".svg"}, dir_:"figures/"] :=
    safeSave[dir <> name <> #, p]& /@ fmts;

saveName[c_] :=
    StringReplace[StringRiffle[ToString /@ c, "_"], " -> " -> "="]

EndPackage[];
