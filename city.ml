(** Random floating number generator*)
let random_float x y = x +. Random.float (y -. x)

(** draw filename for the canvas width and height*)
let generate_building filename w h =

  (* PDF surface *)
  let surface = Cairo.PDF.create ~fname:filename ~width:w ~height:h in
  (* obtain context *)
  let cr = Cairo.create surface in
  
  (*the building function*)
  let building xaxis yaxis apts floors =
    Cairo.save cr;

    let width = (apts *. 16.0) +. (2.0 *. 7.0)  in
    let height = (floors *. 16.0) +. (2.0 *. 7.0)  in
    
    Cairo.translate cr xaxis (yaxis -. height);
    
    Cairo.set_source_rgba cr 0.0 0.0 0.0 1.0;
    Cairo.rectangle cr 0.0 0.0 width height;
    Cairo.fill cr;

    Cairo.save cr;
    Cairo.set_source_rgba cr 0.0 0.5 0.5 0.5;
    Cairo.translate cr 4.0 4.0;
    Cairo.translate cr 4.0 4.0;
 
    let count = int_of_float apts in 
    let floor_count = int_of_float floors in
    (* drawing windows by the floor and #apts*)
    for i = 0 to (floor_count - 1) do
      Cairo.save cr; 
      Cairo.translate cr 4.0 4.0;
      for j = 0 to (count - 1) do
        Cairo.rectangle cr 0.0 0.0 8.0 10.0;
        Cairo.fill cr;
        Cairo.translate cr 16.0 0.0;
      done;

      Cairo.restore cr;
      Cairo. translate cr 0.0 16.0;
    done;  

    Cairo.restore cr;

    Cairo.restore cr;
   
  in
   (*building it manually .. 
     working to make it more random and generate it self*)
    building 10.0 250.0 3.0 6.0;
    building 40.0 250.0 5.0 10.0;
    building 135.0 250.0 3.0 4.0;
    building 202.0 250.0 2.0 14.0;
    building 240.0 250.0 4.0 13.0;
    building 320.0 250.0 4.0 11.0;
    
  Cairo.Surface.finish surface

let () =
  generate_building "mypp.pdf" 400.0 250.0

(*
    let x = Random.float 4.0;
    let y = Random.float 6.0;
    let s = Random.float 4.0;
    let t = Random.float 6.0;
  }
*)
