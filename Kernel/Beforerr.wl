(* ::Package:: *)

(* ::Section:: *)

(*Package Header*)

BeginPackage["Beforerr`"];

(* ::Text:: *)

(*Declare your public symbols here:*)

loadPackages::usage = "loadPackages[] loads all packages in the current directory";

Get["Beforerr`SavingUtils`"]

Begin["`Private`"];

(* ::Section:: *)

(*Definitions*)

(* ::Text:: *)

(*Define your public and private symbols here:*)

loadPackages[dir_ : DirectoryName @ $InputFileName] :=
    Get /@ FileNames["*.m", dir]

(* ::Section::Closed:: *)

(*Package Footer*)

End[];

EndPackage[];
