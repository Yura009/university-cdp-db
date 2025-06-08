| Index Type      | Field     | Creation Time | Query                  | Execution Time | Index Size | Notes                                                  |
| --------------- | --------- | ------------- | ---------------------- | -------------- | ---------- | ------------------------------------------------------ |
| **B-tree**      | `name`    | \~1.08 sec    | `name = 'Name50000'`   | **0.076 ms**   | Small      | Ideal for exact match queries using `=`                |
| **Hash**        | `name`    | \~0.41 sec    | `name = 'Name50000'`   | **0.074 ms**   | Small      | Slightly faster than B-tree for `=`, but less flexible |
| **GIN (trgm)**  | `surname` | \~1.09 sec    | `surname LIKE '%123%'` | **0.798 ms**   | \~22 MB    | Best for full-text or pattern searches with `LIKE`     |
| **GiST (trgm)** | `surname` | \~4.25 sec    | `surname LIKE '%123%'` | **7.46 ms**    | \~16 MB    | Slower than GIN but creates smaller index              |
