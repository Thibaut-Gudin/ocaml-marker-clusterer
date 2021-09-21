type mc (*the MarkerClusterer type*)

val t : unit -> mc [@@js.get "MarkerClusterer"]

(*val t_v2 : unit -> mc [@@js.get "window.MarkerClusterer"]*)

[@@@js.stop]

type mc_elt = mc Js_of_ocaml.Js.t

(*a MarkerClusterer element*)

[@@@js.start]

[@@@js.implem type mc_elt = mc Js_of_ocaml.Js.t]

[@@@js.implem let mc_elt_of_js = Obj.magic]

[@@@js.implem let mc_elt_to_js = Obj.magic]

type map

val new_map : unit -> map [@@js.new "google.maps.Map"]

type marker

type lat_long

val lat_long : lat:float -> long:float -> lat_long
  [@@js.builder] [@@js.verbatim_names]

val new_marker : myLatLong:lat_long -> ?map:map -> unit -> marker
  [@@js.new "google.maps.Marker"]

type styles

val styles :
  ?url:string ->
  ?height:int ->
  ?width:int ->
  ?anchor:int array ->
  ?text_color:string ->
  ?text_size:int ->
  unit ->
  styles
  [@@js.builder] [@@js.verbatim_names]

type opts

val opts :
  ?grid_size:int ->
  ?max_zoom:int ->
  ?zoom_on_click:bool ->
  ?info_on_click:bool ->
  ?info_on_click_zoom:int ->
  ?styles:styles ->
  unit ->
  opts
  [@@js.builder] [@@js.verbatim_names]

val new_marker_clusterer :
  (*mc ->*) map -> ?opt_markers:marker -> ?opt_options:opts -> unit -> mc_elt
  [@@js.new "MarkerClusterer"]

val new_marker_clusterer_v2 :
  map -> ?opt_markers:marker -> ?opt_options:opts -> unit -> mc_elt
  [@@js.new "window.MarkerClusterer"]

val set_max_zoom : mc_elt -> int -> unit [@@js.call "setMaxZoom"]

val add_marker : mc_elt -> marker -> ?opt_nodraw:bool -> unit -> unit
  [@@js.call "addMarker"]
