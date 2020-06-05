(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

let add_pet ~pet_t =
    let open Lwt in
    let uri = Request.build_uri "/pet" in
    let headers = Request.default_headers in
    let body = Request.write_as_json_body Pet.to_yojson pet_t in
    Cohttp_lwt_unix.Client.call `POST uri ~headers ~body >>= fun (resp, body) ->
    Request.read_json_body_as (JsonSupport.unwrap Pet.of_yojson) resp body

let delete_pet ~pet_id ?api_key () =
    let open Lwt in
    let uri = Request.build_uri "/pet/{petId}" in
    let headers = Request.default_headers in
    let headers = Request.maybe_add_header headers "api_key" (fun x -> x) api_key in
    let uri = Request.replace_path_param uri "petId" Int64.to_string pet_id in
    Cohttp_lwt_unix.Client.call `DELETE uri ~headers >>= fun (resp, body) ->
    Request.handle_unit_response resp

let find_pets_by_status ~status =
    let open Lwt in
    let uri = Request.build_uri "/pet/findByStatus" in
    let headers = Request.default_headers in
    let uri = Request.add_query_param_list uri "status" (List.map Enums.show_pet_status) status in
    Cohttp_lwt_unix.Client.call `GET uri ~headers >>= fun (resp, body) ->
    Request.read_json_body_as_list_of (JsonSupport.unwrap Pet.of_yojson) resp body

let find_pets_by_tags ~tags =
    let open Lwt in
    let uri = Request.build_uri "/pet/findByTags" in
    let headers = Request.default_headers in
    let uri = Request.add_query_param_list uri "tags" (List.map (fun x -> x)) tags in
    Cohttp_lwt_unix.Client.call `GET uri ~headers >>= fun (resp, body) ->
    Request.read_json_body_as_list_of (JsonSupport.unwrap Pet.of_yojson) resp body

let get_pet_by_id ~pet_id =
    let open Lwt in
    let uri = Request.build_uri "/pet/{petId}" in
    let headers = Request.default_headers in
    let headers = Cohttp.Header.add headers "api_key" Request.api_key in
    let uri = Request.replace_path_param uri "petId" Int64.to_string pet_id in
    Cohttp_lwt_unix.Client.call `GET uri ~headers >>= fun (resp, body) ->
    Request.read_json_body_as (JsonSupport.unwrap Pet.of_yojson) resp body

let update_pet ~pet_t =
    let open Lwt in
    let uri = Request.build_uri "/pet" in
    let headers = Request.default_headers in
    let body = Request.write_as_json_body Pet.to_yojson pet_t in
    Cohttp_lwt_unix.Client.call `PUT uri ~headers ~body >>= fun (resp, body) ->
    Request.read_json_body_as (JsonSupport.unwrap Pet.of_yojson) resp body

let update_pet_with_form ~pet_id ?name ?status () =
    let open Lwt in
    let uri = Request.build_uri "/pet/{petId}" in
    let headers = Request.default_headers in
    let uri = Request.replace_path_param uri "petId" Int64.to_string pet_id in
    let body = Request.init_form_encoded_body () in
    let body = Request.maybe_add_form_encoded_body_param body "name" (fun x -> x) name in
    let body = Request.maybe_add_form_encoded_body_param body "status" (fun x -> x) status in
    let body = Request.finalize_form_encoded_body body in
    Cohttp_lwt_unix.Client.call `POST uri ~headers ~body >>= fun (resp, body) ->
    Request.handle_unit_response resp

let upload_file ~pet_id ?additional_metadata ?file () =
    let open Lwt in
    let uri = Request.build_uri "/pet/{petId}/uploadImage" in
    let headers = Request.default_headers in
    let uri = Request.replace_path_param uri "petId" Int64.to_string pet_id in
    let body = Request.init_form_encoded_body () in
    let body = Request.maybe_add_form_encoded_body_param body "additional_metadata" (fun x -> x) additional_metadata in
    let body = Request.maybe_add_form_encoded_body_param body "file" (fun x -> x) file in
    let body = Request.finalize_form_encoded_body body in
    Cohttp_lwt_unix.Client.call `POST uri ~headers ~body >>= fun (resp, body) ->
    Request.read_json_body_as (JsonSupport.unwrap Api_response.of_yojson) resp body

