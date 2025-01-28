# Hardware Security Project

Proiect: Implementarea unui sistem de criptare în Verilog 
Scopul temei: Scopul acestei teme este să implementați folosind Verilog un sistem de criptare 
bazat pe un tabel de subs tuție și un secret.  
Obiec ve: 
1. Îmbunătățirea abilităților de programare hardware: Dezvoltarea abilității de a 
implementa și testa un algoritm de criptare folosind Verilog, punând accent pe înțelegerea 
logicii de criptare și a manipulării datelor. 
2. Simularea unui sistem de criptare personalizat: Înțelegerea modului în care un sistem de 
criptare poate fi personalizat în funcție de parametrii specifici (prenume, nume de 
familie), și aplicarea acestui concept în Verilog pentru a simula un as el de sistem. 
3. Testarea și validarea circuitelor digitale: Crearea și u lizarea testbench-urilor pentru a 
valida corec tudinea design-ului hardware, asigurându-se că procesul de criptare și 
decriptare funcționează corect pe diverse seturi de date. 
4. Dezvoltarea gândirii algoritmice: Aplicarea unor tehnici de procesare a datelor și calcul 
matema c pentru a obține rezultate corecte în criptarea și decriptarea mesajelor. 
Cerințe: 
1. Crearea unui tabel personalizat folosind prenumele: Se va crea un table de subs tuție de 
dimensiune 5x5 as el.:  
o Fiecare student va u liza literele dis ncte din prenumele lor pentru a completa 
primele căsuțe din tabel.  
o După completarea acestuia, veți adăuga restul literelor din alfabet, excluzând o 
literă la alegere pentru a se potrivi într-un tabel 5x5 (sunt 26 de caractere în 
alfabet). 
Exemplu pentru MIHAI și litera “J”
 
|   | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|
| 1 | M | I | H | A | B |
| 2 | C | D | E | F | G |
| 3 | K | L | N | O | P |
| 4 | Q | R | S | T | U |
| 5 | V | W | X | Y | Z |
   
3. Algoritmul de criptare: Fiecare student va u liza propriul nume de familie ca secret 
pentru criptare. 
o Fiecare literă din mesajul de criptat va fi căutată în tabelul personalizat, punctul 1, 
pentru a-i obține valoarea.  
o Se însumează cu valoarea corespunzătoare din cuvântul secret (repetându-l până 
la lungimea textului). 
Exemplu pentru secretul „DAN” textul clar „ISMASE”
 
| I  | S  | M  | A  | S  | E  |
|----|----|----|----|----|----|
| 12 | 42 | 11 | 14 | 42 | 23 |
| D  | A  | N  | D  | A  | N  |
| 22 | 14 | 33 | 22 | 14 | 33 |
| 34 | 56 | 44 | 36 | 56 | 56 |

4. [2 x 30p] Criptarea și decriptarea: Implementați atât funcționalitatea de criptare, cât și pe 
cea de decriptare. Trebuie să creați două module separate: unul pentru criptare și unul 
pentru decriptare, fiecare având o intrare de text (sau cipher text) și un cuvânt secret, iar 
rezultatul va fi un mesaj criptat, respec v decriptat. 
5. [10 x 2p] Testbench: Trebuie să creați minim 10 testbench-uri (5 pentru criptare, 5 pentru 
decriptare) care să acopere următoarele scenarii (secretul va fi mereu același): 
o Criptarea unei singure litere. 
o Criptarea unui cuvânt. 
o Criptarea propriului nume de familie. 
o Criptarea unui mesaj de cel puțin 20 de caractere. 
o Mesaj cu litere repetate. 
6. [10p] Criptarea litere mari și mici: Adăugați mecanisme pentru a cripta litere mari și mici 
fără a modifica tabelul personalizat creat la punctul 1. Demonstrați funcționalitatea prin 
adăugarea de testbench-uri corespunzătoare. 
7. [10p] Criptare caractere speciale: Adăugați mecanisme pentru a cripta și caractere 
speciale (ex. spațiu, „$”, „#”, etc.). Puteți modifica în orice formă doriți codul dvs. 
Demonstrați funcționalitatea prin adăugarea de testbench-uri corespunzătoare.
