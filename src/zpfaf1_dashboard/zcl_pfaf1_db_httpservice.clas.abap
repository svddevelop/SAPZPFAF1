class ZCL_PFAF1_DB_HTTPSERVICE definition
  public
  create public .

public section.

  interfaces IF_HTTP_SERVICE_EXTENSION .
protected section.
private section.
ENDCLASS.



CLASS ZCL_PFAF1_DB_HTTPSERVICE IMPLEMENTATION.


  method IF_HTTP_SERVICE_EXTENSION~HANDLE_REQUEST.

        response->set_text( |'<body><div>list</div></body>'| ).

  endmethod.

ENDCLASS.
