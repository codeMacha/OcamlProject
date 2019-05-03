(** Pasang Sherpa 
    Project : generate a city art through usage of cairo2 lib packages *)

let draw filename =

  let surface = Cairo.PDF.create ~fname:filename ~width:250.0 ~height:150.0 in
  let cr = Cairo.create surface in

  Cairo.set_line_width cr 0.65;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 5.0 125.0;
  Cairo.line_to cr 245.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 5.0 124.0;
  Cairo.line_to cr 245.0 124.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 5.0 123.0;
  Cairo.line_to cr 245.0 123.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 5.0 122.0;
  Cairo.line_to cr 245.0 122.0;
  Cairo.stroke cr;

(*Building lines starts from here*)
  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 10.0 65.0;
  Cairo.line_to cr 10.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 30.0 65.0;
  Cairo.line_to cr 30.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 10.0 65.0;
  Cairo.line_to cr 30.0 65.0;
  Cairo.stroke cr;

(*Second building from left*)
  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 35.0 80.0;
  Cairo.line_to cr 35.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 60.0 80.0;
  Cairo.line_to cr 60.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 35.0 80.0;
  Cairo.line_to cr 60.0 80.0;
  Cairo.stroke cr;

(*third burilding from left*)
  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 61.5 50.0;
  Cairo.line_to cr 61.5 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 82.0 50.0;
  Cairo.line_to cr 82.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 61.5 50.0;
  Cairo.line_to cr 82.0 50.0;
  Cairo.stroke cr;

(*fourth burilding from left*)
  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 102.0 5.0;
  Cairo.line_to cr 102.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 122.0 5.0;
  Cairo.line_to cr 122.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 102.0 5.0;
  Cairo.line_to cr 122.0 5.0;
  Cairo.stroke cr;

(*fifth burilding from left*)

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 138.0 65.0;
  Cairo.line_to cr 138.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 122.0 65.0;
  Cairo.line_to cr 138.0 65.0;
  Cairo.stroke cr;

(*sixth burilding from left*)
  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 145.0 5.0;
  Cairo.line_to cr 145.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 165.0 5.0;
  Cairo.line_to cr 165.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 145.0 5.0;
  Cairo.line_to cr 165.0 5.0;
  Cairo.stroke cr;

(*seventh building from left*)
  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 170.0 50.0;
  Cairo.line_to cr 170.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 195.0 50.0;
  Cairo.line_to cr 195.0 80.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 170.0 50.0;
  Cairo.line_to cr 195.0 50.0;
  Cairo.stroke cr;

(*eigth building from left*)
  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 180.0 80.0;
  Cairo.line_to cr 180.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 225.0 80.0;
  Cairo.line_to cr 225.0 125.0;
  Cairo.stroke cr;

  Cairo.set_source_rgba cr 0.3 0.3 0.7 1.0;
  Cairo.move_to cr 180.0 80.0;
  Cairo.line_to cr 225.0 80.0;
  Cairo.stroke cr;


  Cairo.Surface.finish surface

let () =
  draw "mycity.pdf"
