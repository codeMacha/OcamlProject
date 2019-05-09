(** Random floating number generator*)
let random_float x y =   
  x +. Random.float (y -. x)


(** drawing building windows function*)
let makewindows windowType cr =
  match windowType with
      1 -> Cairo.rectangle cr 4.0 2.0 7.0 9.0;
           Cairo.fill cr;
    | 2 -> Cairo.rectangle cr 0.0 3.0 18.0 8.0;
           Cairo.fill cr;
    | 3 -> Cairo.rectangle cr 5.0 1.0 8.0 16.0;
           Cairo.fill cr
    | _ -> Cairo.rectangle cr 4.0 2.0 7.0 9.0;
           Cairo.fill cr

(** drawing building windows function*)
let buildroof wii roofType cr =
Cairo.save cr;
  match roofType with 
      1 -> Cairo.set_source_rgba cr 0.0 0.0 0.0 0.1;
           Cairo.translate cr (16.0 /. 2.0) (-16.0);
           Cairo.rectangle cr 0.0 0.0 (wii -. 16.0) 16.0;
 		   Cairo.fill cr;
           
    | 2 -> Cairo.set_source_rgba cr 0.0 0.0 0.0 0.1;
		   Cairo.translate cr (16.0 /. 2.0) (-16.0);
           Cairo.rectangle cr 0.0 0.0 (wii -. 10.0) 24.0;
 		   Cairo.fill cr;

    | _ -> Cairo.translate cr (16.0 /. 2.0) (-16.0);
           Cairo.rectangle cr 0.0 0.0 (wii -. 16.0) 16.0;
 		   Cairo.fill cr;

Cairo.restore cr

(** drawing building function*)
let building xaxis yaxis apts floors wType rType cr=
  (*save the current state of context*)
  Cairo.save cr;

  let width = (apts *. 16.0) +. (4.0 *. 2.0)  in
  let height = (floors *. 16.0) +. (4.0 *. 2.0)  in
    
  Cairo.translate cr xaxis (yaxis -. height);
  Cairo.set_source_rgba cr 0.0 0.0 0.0 1.0;
  Cairo.rectangle cr 0.0 0.0 width height;
  Cairo.fill cr;

  Cairo.save cr;
  Cairo.translate cr 4.0 4.0;
  Cairo.set_source_rgba cr 0.5 0.5 0.5 0.5;
 
  let count = int_of_float apts in 
  let floor_count = int_of_float floors in
  (* drawing windows by the floor and #apts*)
  for i = 0 to (floor_count - 1) do
    Cairo.save cr; 
      for j = 0 to (count - 1) do
        makewindows wType cr;
        Cairo.translate cr 16.0 0.0;
      done;
    Cairo.restore cr;
    Cairo.translate cr 0.0 16.0;
  done;  
  Cairo.restore cr;
  Cairo.restore cr

(** create the canvas width and height*)
let generate_building filename wh ht =

  (* PDF surface *)
  let surface = Cairo.PDF.create ~fname:filename ~width:wh ~height:ht in
  (* obtain context *)
  let cr = Cairo.create surface in
  let groundlevel = 525.0 in

  (* generating building in loop till width of canvas *)
  let rec f xs cr= 
    if xs <= wh then
             let apt = random_float 4.0 8.0 in
             let winType = Random.int 3 in
             let roType = Random.int 2 in
             let floor = random_float 4.0 25.0 in
             building xs groundlevel apt floor winType roType cr;
             f (xs +. 40.0) cr
    else xs
  in
(*unused variable to solve syntax for the loop *)  
  let solnforsyntax = f 0.0 cr in

(* road on the edge of the river*)
  Cairo.set_source_rgba cr 0.0 0.0 0.0 1.0;
  Cairo.rectangle cr 0.0 526.0 wh 8.0;
  Cairo.fill cr;

  Cairo.set_source_rgba cr 0.0 0.0 0.0 1.0;
  Cairo.rectangle cr 0.0 536.0 wh 8.0;
  Cairo.fill cr;

(* static river with color blue*)
  Cairo.set_source_rgba cr 0.0 0.3 0.4 0.9;
  Cairo.rectangle cr 0.0 544.0 wh 255.0;
  Cairo.fill cr;
      
  Cairo.Surface.finish surface

(** main *)
let () =
  Random.self_init ();
  generate_building "mycity.pdf" 1400.0 800.0

