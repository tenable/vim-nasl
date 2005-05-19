" Vim syntax file
" Language:	NASL
" Maintainer:	Herman Polloni <polloni@confianze.com>
" Last Change:	2005 May 19
"

" Remove any old syntax stuff that was loaded (5.x) or quit when a syntax file
" was already loaded (6.x).
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Built-in functions extracted from nasl_init.c  
" NASL 2.0.10
syn keyword naslFunction script_name script_version script_timeout script_description script_copyright
syn keyword naslFunction script_summary script_category script_family script_dependencie script_dependencies
syn keyword naslFunction script_require_keys script_require_ports script_require_udp_ports script_exclude_keys
syn keyword naslFunction script_add_preference script_get_preference script_id script_cve_id script_bugtraq_id
syn keyword naslFunction script_xref safe_checks set_kb_item get_kb_item get_kb_list security_warning
syn keyword naslFunction security_note security_hole
syn keyword naslFunction open_sock_tcp  open_sock_tcp open_sock_udp open_priv_sock_tcp open_priv_sock_udp
syn keyword naslFunction recv recv_line send close join_multicast_group leave_multicast_group
syn keyword naslFunction cgibin is_cgi_installed http_open_socket http_head http_get http_post
syn keyword naslFunction http_delete http_put http_close_socket http_recv_headers
syn keyword naslFunction get_host_name
syn keyword naslFunction get_host_ip
syn keyword naslFunction get_host_open_port
syn keyword naslFunction get_port_state
syn keyword naslFunction get_tcp_port_state
syn keyword naslFunction get_udp_port_state
syn keyword naslFunction scanner_add_port
syn keyword naslFunction scanner_status
syn keyword naslFunction scanner_get_port
syn keyword naslFunction islocalhost
syn keyword naslFunction islocalnet
syn keyword naslFunction get_port_transport
syn keyword naslFunction this_host
syn keyword naslFunction this_host_name
syn keyword naslFunction string
syn keyword naslFunction raw_string
syn keyword naslFunction strcat
syn keyword naslFunction display
syn keyword naslFunction ord
syn keyword naslFunction hex
syn keyword naslFunction hexstr
syn keyword naslFunction strstr
syn keyword naslFunction ereg
syn keyword naslFunction ereg_replace
syn keyword naslFunction egrep
syn keyword naslFunction eregmatch
syn keyword naslFunction match
syn keyword naslFunction substr
syn keyword naslFunction insstr
syn keyword naslFunction tolower
syn keyword naslFunction toupper
syn keyword naslFunction crap
syn keyword naslFunction strlen
syn keyword naslFunction split
syn keyword naslFunction chomp
syn keyword naslFunction int
syn keyword naslFunction stridx
syn keyword naslFunction str_replace
syn keyword naslFunction make_list
syn keyword naslFunction make_array
syn keyword naslFunction keys
syn keyword naslFunction max_index
syn keyword naslFunction sort
syn keyword naslFunction telnet_init
syn keyword naslFunction ftp_log_in
syn keyword naslFunction ftp_get_pasv_port
syn keyword naslFunction start_denial
syn keyword naslFunction end_denial
syn keyword naslFunction dump_ctxt
syn keyword naslFunction typeof
syn keyword naslFunction exit
syn keyword naslFunction rand
syn keyword naslFunction usleep
syn keyword naslFunction sleep
syn keyword naslFunction isnull
syn keyword naslFunction defined_func
syn keyword naslFunction forge_ip_packet
syn keyword naslFunction get_ip_element
syn keyword naslFunction set_ip_elements
syn keyword naslFunction insert_ip_options
syn keyword naslFunction dump_ip_packet
syn keyword naslFunction forge_tcp_packet
syn keyword naslFunction get_tcp_element
syn keyword naslFunction set_tcp_elements
syn keyword naslFunction dump_tcp_packet
syn keyword naslFunction tcp_ping
syn keyword naslFunction forge_udp_packet
syn keyword naslFunction get_udp_element
syn keyword naslFunction set_udp_elements
syn keyword naslFunction dump_udp_packet
syn keyword naslFunction forge_icmp_packet
syn keyword naslFunction get_icmp_element
syn keyword naslFunction forge_igmp_packet
syn keyword naslFunction send_packet
syn keyword naslFunction pcap_next
syn keyword naslFunction MD2 
syn keyword naslFunction MD4
syn keyword naslFunction MD5
syn keyword naslFunction SHA
syn keyword naslFunction SHA1
syn keyword naslFunction RIPEMD160
syn keyword naslFunction HMAC_MD2
syn keyword naslFunction HMAC_MD5
syn keyword naslFunction HMAC_SHA
syn keyword naslFunction HMAC_SHA1
syn keyword naslFunction HMAC_DSS
syn keyword naslFunction HMAC_RIPEMD160
syn keyword naslFunction NTLMv1_HASH
syn keyword naslFunction NTLMv2_HASH
syn keyword naslFunction nt_owf_gen
syn keyword naslFunction lm_owf_gen
syn keyword naslFunction ntv2_owf_gen

" Constants extracted from nasl_init.c
syn keyword naslConstant TRUE
syn keyword naslConstant FALSE
syn keyword naslConstant pcap_timeout
syn keyword naslConstant IPPROTO_TCP
syn keyword naslConstant IPPROTO_UDP
syn keyword naslConstant IPPROTO_ICMP
syn keyword naslConstant IPROTO_IP
syn keyword naslConstant IPPROTO_IGMP
syn keyword naslConstant ENCAPS_IP
syn keyword naslConstant ENCAPS_SSLv23
syn keyword naslConstant ENCAPS_SSLv2
syn keyword naslConstant ENCAPS_SSLv3
syn keyword naslConstant ENCAPS_TLSv1
syn keyword naslConstant NASL_LEVEL
syn keyword naslConstant TH_FIN
syn keyword naslConstant TH_SYN
syn keyword naslConstant TH_RST
syn keyword naslConstant TH_PUSH
syn keyword naslConstant TH_ACK
syn keyword naslConstant TH_URG
syn keyword naslConstant IP_RF
syn keyword naslConstant IP_DF
syn keyword naslConstant IP_MF
syn keyword naslConstant IP_OFFMASK
syn keyword naslConstant ACT_INIT
syn keyword naslConstant ACT_GATHER_INFO
syn keyword naslConstant ACT_ATTACK
syn keyword naslConstant ACT_MIXED_ATTACK
syn keyword naslConstant ACT_DESTRUCTIVE_ATTACK
syn keyword naslConstant ACT_DENIAL
syn keyword naslConstant ACT_SCANNER
syn keyword naslConstant ACT_SETTINGS
syn keyword naslConstant ACT_KILL_HOST
syn keyword naslConstant ACT_END
syn keyword naslConstant MSG_OOB

" Keywords extracted from nasl_grammar.tab.c
syn keyword naslKeyword if else for while repeat until foreach function return
syn keyword naslKeyword include break local_var global_var

" Special characters and strings
syn match   naslSpecial	display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region  naslString	start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=naslSpecial
syn region  naslString	start=+L\='+ skip=+\\\\\|\\"+ end=+'+ contains=naslSpecial

" Comments
syn region  naslComment	start="#" skip="\$" end="$" keepend

" Hexadecimal and integer numbers
syn match   naslNumbers display transparent "\<\d\|\.\d" contains=naslNumber
syn match   naslNumber display contained "0x\x\+\>"
syn match   naslNumber display contained "\d\+\>"

" Arguments in a function call
syn match   naslArg display contained "\a\+:"
syn region  naslCall display transparent start="(" end=")" contains=naslArg,naslNumbers,naslString

if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink naslKeyword Conditional
  HiLink naslFunction StorageClass
  HiLink naslConstant Macro
  HiLink naslSpecial SpecialChar
  HiLink naslString String
  HiLink naslComment Comment
  HiLink naslNumber SpecialChar
  HiLink naslArg Macro
endif
let b:current_syntax = "nasl"

" vim: ts=8
