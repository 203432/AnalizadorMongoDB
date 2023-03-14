package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}
( use ) {return new Symbol(sym.use, yychar, yyline, yytext());}
( collection ) {return new Symbol(sym.collection, yychar, yyline, yytext());}
( insertOne ) {return new Symbol(sym.insertOne, yychar, yyline, yytext());}
( find ) {return new Symbol(sym.find, yychar, yyline, yytext());}
( updateOne ) {return new Symbol(sym.updateOne, yychar, yyline, yytext());}
( filter ) {return new Symbol(sym.filter, yychar, yyline, yytext());}
( update ) {return new Symbol(sym.update, yychar, yyline, yytext());}
( deleteOne ) {return new Symbol(sym.deleteOne, yychar, yyline, yytext());}
( close ) {return new Symbol(sym.close, yychar, yyline, yytext());}
( "(" ) {return new Symbol(sym.ParentesisA, yychar, yyline, yytext());}
( ")" ) {return new Symbol(sym.ParentesisC, yychar, yyline, yytext());}
( "{" ) {return new Symbol(sym.LlaveA, yychar, yyline, yytext());}
( "}" ) {return new Symbol(sym.LlaveC, yychar, yyline, yytext());}
( ":" ) {return new Symbol(sym.PuntoDoble, yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
