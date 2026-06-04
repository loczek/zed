; TODO: Fix queries that start with `binary_expression` when https://github.com/tree-sitter/tree-sitter-typescript/issues/341 gets fixed
;
; css``, keyframes``, createGlobalStyle``
(call_expression
  function: (identifier) @_name
  (#any-of? @_name "css" "keyframes" "createGlobalStyle")
  arguments: (template_string
    ((_)+) @injection.content
    (#set! injection.language "styled")))

; styled.div``
(call_expression
  function: (member_expression
    object: (identifier) @_name
    (#eq? @_name "styled"))
  arguments: (template_string
    ((_)+) @injection.content
    (#set! injection.language "styled")))

; styled.div.attrs()``
(call_expression
  function: (call_expression
    function: (member_expression
      object: (member_expression
        object: (identifier) @_name
        (#eq? @_name "styled"))))
  arguments: (template_string
    ((_)+) @injection.content
    (#set! injection.language "styled")))

; styled(Component)``
(call_expression
  function: (call_expression
    function: (identifier) @_name
    arguments: (arguments)
    (#eq? @_name "styled"))
  arguments: (template_string
    ((_)+) @injection.content
    (#set! injection.language "styled")))

; styled(Component).attrs()``
(call_expression
  function: (call_expression
    function: (member_expression
      object: (call_expression
        function: (identifier) @_name
        (#eq? @_name "styled"))))
  arguments: (template_string
    ((_)+) @injection.content
    (#set! injection.language "styled")))
