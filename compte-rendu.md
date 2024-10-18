# TP4

## Exercice 1

1. mov eax, 0xABCDEF01
    * esp : x
    * eax : 0xABCDEF01
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x | ? |
| ... | ... |

2. push eax
    * esp : x-4
    * eax : 0xABCDEF01
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x-4 | 0xABCDEF01 |
| x | ? |
| ... | ... |

3. mov eax, 0x01234567
    * esp : x-4
    * eax : 0x01234567
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x-4 | 0xABCDEF01 |
| x | ? |
| ... | ... |

4. push eax
    * esp : x-8
    * eax : 0x01234567
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x-8 | 0x01234567 |
| x-4 | 0xABCDEF01 |
| x | ? |
| ... | ... |

5. pop eax
    * esp : x-4
    * eax : 0x01234567
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x-4 | 0xABCDEF01 |
| x | ? |
| ... | ... |

6. pop eax
    * esp : x
    * eax : 0xABCDEF01
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x | ? |
| ... | ... |

## Exercice 2

* push eax

```asm
mov [esp-4], eax
mov eax, esp
add eax, -4
```

* pop ebx

```asm
mov ebx, [esp]
mov eax, esp
add eax, 4
```

## Exercice 3

1.
    * eax : 0
    * ebx : 0
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| ebp-12 | 15 |
| ebp-8 | 13 |
| ebp-4 | 12 |
| ebp | ? |
| ... | ... |

2.
    * eax : 28
    * ebx : 13
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| ebp-4 | 12 |
| ebp | ? |
| ... | ... |

3.
    * eax : 28
    * ebx : 13
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| ebp-12 | 13 |
| ebp-8 | 9 |
| ebp-4 | 12 |
| ebp | ? |
| ... | ... |

4.
    * eax : 13
    * ebx : 12
    * pile :

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| ebp | ? |
| ... | ... |

## Exercice 6

```asm
    push suite
    jmp print_int
suite :
    mov eax, 0
    ...

print_int :
    ...    
```

## Exercice 7

1. call f

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x-4 | f |
| x | ? |
| ... | ... |

2. call g

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x-8 | g |
| x-4 | f |
| x | ? |
| ... | ... |

3. ret

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x-4 | f |
| x | ? |
| ... | ... |

4. ret

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x | ? |
| ... | ... |

5. call g

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x | g |
| x | ? |
| ... | ... |

6. ret

| Adresse | Valeur |
| :-: | :-: |
| ... | ... |
| x | ? |
| ... | ... |

7. mov ebx, 0
8. mov eax, 1
9. int 0x80

## Exercice 8

1. On ne sait pas la valeur dans ecx lorsque son  ajout sur la pile, si c'est un paramètre de la fonction la convention veut qu'il soit passé dans eax.
2. L'état de la pile est modifié : esp pointe 4 octets plus haut qu'avant l'appel de fonction comme 2 push sont appelé pour 1 pop.
3. eax et ebx ont des valeurs différentes d'avant l'appel de la fonction.
