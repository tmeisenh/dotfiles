#!/usr/bin/env bash
#
# Wrapper script for mailx that makes sending email, even
# with attachments much easier. For text files you might need
# to convert the line endings.
#
# Author: Travis B. Meisenheimer

# Set executables
mailx=/usr/bin/mailx
uuencode=/usr/bin/uuencode
basename=/usr/bin/basename

# display usage
usage() {
    cat <<EOF
usage: $0 options

OPTIONS:
   -h      Show this message
   -help   Show this message
   -t	   to (list)
   -s      subject
   -m      message
   -a      attachment (if system supports it)
EOF
}

# Parse options
while getopts ":ht:s:m:a:" OPTION; do
    case $OPTION in
    h)
        usage
        exit 1
        ;;
    t)
        TO_LIST="${OPTARG}"
        ;;
    s)
        SUBJECT="${OPTARG}"
        ;;
    m)
        MESSAGE="${OPTARG}"
        ;;
    a)
        ATTACHMENT="${OPTARG}"
        ;;
    \?)
        echo "Invalid option: -$OPTARG"
        usage
        exit 1
        ;;
    esac
done

# Check input params, bail if required ones are not set
if [[ -z $TO_LIST ]] || [[ -z $SUBJECT ]] || [[ -z $MESSAGE ]]; then
    usage
    exit 1
fi

#echo "TO_LIST: ${TO_LIST}"
#echo "SUBJECT: ${SUBJECT}"
#echo "MESSAGE: ${MESSAGE}"
#echo "ATTACHMENT: ${ATTACHMENT}"

_ret=2

if [[ -z ${ATTACHMENT} ]]; then
    echo "${MESSAGE}" | $mailx -s "${SUBJECT}" "${TO_LIST}"
    _ret=$?
else
    (echo "${MESSAGE}" | $uuencode "${ATTACHMENT}" "$($basename "$ATTACHMENT")") | $mailx -s "${SUBJECT}" "${TO_LIST}"
    _ret=$?
fi

exit $_ret
