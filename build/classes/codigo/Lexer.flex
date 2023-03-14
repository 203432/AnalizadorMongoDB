package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L = [a-zA-Z_]+
D = [0-9]+
WHITE=[ ,\t,\r]+
SALTO=[\n]
%{
public String lexeme;
%}
%%
use {lexeme=yytext(); return use;}
collection {lexeme=yytext(); return collection;}
insertOne {lexeme=yytext(); return insertOne;}
find {lexeme=yytext(); return find;}
updateOne {lexeme=yytext(); return updateOne;}
filter {lexeme=yytext(); return filter;}
update {lexeme=yytext(); return update;}
deleteOne {lexeme=yytext(); return deleteOne;}
close {lexeme=yytext(); return close;}
"(" {lexeme=yytext(); return ParentesisA;}
")" {lexeme=yytext(); return ParentesisC;}
"{" {lexeme=yytext(); return LlaveA;}
"}" {lexeme=yytext(); return LlaveC;}
":" {lexeme=yytext(); return PuntoDoble;}
"," {lexeme=yytext(); return Coma;}
"\"" {lexeme=yytext(); return Comillas;}

{WHITE} {/*Ignore*/}
{SALTO} {lexeme=yytext(); return Linea;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
 ("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
. {return ERROR;}