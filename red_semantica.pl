atributo(animal, puede, respirar).
atributo(ave, es_un, animal).
atributo(ave, vuela, bien).
atributo(ave, tiene, plumas).
atributo(ave, pone, huevos).
atributo(mamifero, es_un, animal).
atributo(mamifero, tiene, pelo).
atributo(mamifero, da, leche).
atributo(avestruz, es_un, ave).
atributo(avestruz, tiene, patas).
atributo(avestruz, vuela, no_puede).
atributo(albatros, es_un, ave).
atributo(albatros, vuela, muy_bien).
atributo(ballena, es_un, mamifero).
atributo(ballena, tiene, piel).
atributo(ballena, vive_en, mar).
atributo(tigre, es_un, mamifero).
atributo(tigre, come, carne).

atributo(A, B, C) :- dif(A, animal), dif(B, es_un), atributo(A, es_un, D), atributo(D, B, C).

atributo_(animal, puede, respirar).
atributo_(ave, es_un, animal).
atributo_(ave, vuela, bien).
atributo_(ave, tiene, plumas).
atributo_(ave, pone, huevos).
atributo_(mamifero, es_un, animal).
atributo_(mamifero, tiene, pelo).
atributo_(mamifero, da, leche).
atributo_(avestruz, es_un, ave).
atributo_(avestruz, tiene, patas).
atributo_(avestruz, vuela, no_puede).
atributo_(albatros, es_un, ave).
atributo_(albatros, vuela, muy_bien).
atributo_(ballena, es_un, mamifero).
atributo_(ballena, tiene, piel).
atributo_(ballena, vive_en, mar).
atributo_(tigre, es_un, mamifero).
atributo_(tigre, come, carne).

particular(A, B, C) :- atributo_(A, B, C), atributo_(A, es_un, D), atributo_(D, B, _), dif(B, es_un).