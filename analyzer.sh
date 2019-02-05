HEIGLIGHT='\033[0;37m'
NO_COLOR='\033[0m'

rubocop && \
echo -e "${HEIGLIGHT}
rubocop OK
${NO_COLOR}" && \

rspec && \
echo -e "${HEIGLIGHT}
rspec OK
${NO_COLOR}" && \

reek && \
echo -e "${HEIGLIGHT}
reek OK
${NO_COLOR}" && \

bundle-audit -u && \
echo -e "${HEIGLIGHT}
bundle-audit -u OK
${NO_COLOR}" && \

echo -e "${HEIGLIGHT}
ALL OK
${NO_COLOR}"
