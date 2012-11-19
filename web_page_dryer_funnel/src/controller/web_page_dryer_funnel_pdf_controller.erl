-module(web_page_dryer_funnel_pdf_controller, [Req]).
-compile(export_all).

hello('GET',[]) ->
	{ok, [{status, "awake"}]}.

wake('GET', []) ->
	{json, [{status, "awake"}]}.


pdf('GET', []) -> ok;
pdf('POST',[]) ->
	Html = Req:post_param("conversion_url"),
	PdfFileName = lists:concat(tuple_to_list(now())) ++ ".pdf",
	TmpPdf = "/tmp/" ++ PdfFileName,
	Cmd = "/usr/local/bin/wkhtmltopdf " ++ Html ++ " " ++ TmpPdf,
	os:cmd(Cmd),
	{ok, PdfFile} = file:read_file(TmpPdf),
	file:delete(TmpPdf),
	{output, PdfFile, [{"Content-Type", "application/pdf"}]}.

%_('GET',[]) ->
%	{ok, [index]}.
