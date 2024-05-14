# pre-commit conventional check

```yaml
repos:
- repo: git://github.com:cheolwonkim/pre-commit
  rev: main
  hooks:
    -
      id: conventional-commit-check
      stages:
        - commit-msg
```
