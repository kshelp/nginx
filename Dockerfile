FROM nginx:alpine

LABEL Name=nginx Version=alpine

# nginx.conf가 필요하다면 유지 (선택 사항)
COPY nginx.conf /etc/nginx/nginx.conf

# 인증서 복사 (선택 사항 - 필요 시 유지)
COPY cert.crt /etc/nginx/conf.d/cert.crt
COPY cert.key /etc/nginx/conf.d/cert.key

# nginx 실행
CMD ["nginx", "-g", "daemon off;"]
