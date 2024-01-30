import 'package:flutter/material.dart';

const settingSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M21.1477 14.37C20.9553 14.07 20.6818 13.77 20.3273 13.58C20.0437 13.44 19.8614 13.21 19.6993 12.94C19.1828 12.08 19.4866 10.95 20.3475 10.44C21.3604 9.87 21.6845 8.6 21.0971 7.61L20.4184 6.43C19.8411 5.44 18.5751 5.09 17.5723 5.67C16.681 6.15 15.5365 5.83 15.02 4.98C14.8579 4.7 14.7667 4.4 14.787 4.1C14.8174 3.71 14.6958 3.34 14.5135 3.04C14.1388 2.42 13.4602 2 12.7107 2H11.2825C10.5432 2.02 9.86454 2.42 9.48979 3.04C9.29735 3.34 9.18593 3.71 9.20619 4.1C9.22645 4.4 9.13529 4.7 8.97323 4.98C8.45668 5.83 7.31216 6.15 6.43098 5.67C5.41813 5.09 4.16219 5.44 3.57474 6.43L2.89613 7.61C2.3188 8.6 2.64292 9.87 3.64564 10.44C4.50656 10.95 4.81042 12.08 4.30399 12.94C4.13181 13.21 3.94949 13.44 3.6659 13.58C3.32153 13.77 3.01767 14.07 2.85562 14.37C2.48086 14.99 2.50112 15.77 2.87587 16.42L3.57474 17.62C3.94949 18.26 4.64836 18.66 5.37761 18.66C5.72198 18.66 6.12712 18.56 6.45124 18.36C6.70445 18.19 7.0083 18.13 7.34254 18.13C8.34527 18.13 9.18593 18.96 9.20619 19.95C9.20619 21.1 10.138 22 11.3129 22H12.6904C13.8552 22 14.787 21.1 14.787 19.95C14.8174 18.96 15.658 18.13 16.6608 18.13C16.9849 18.13 17.2887 18.19 17.5521 18.36C17.8762 18.56 18.2712 18.66 18.6257 18.66C19.3448 18.66 20.0437 18.26 20.4184 17.62L21.1274 16.42C21.4921 15.75 21.5225 14.99 21.1477 14.37Z" fill="#CDCDD0"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M12.0118 14.8302C10.4216 14.8302 9.13525 13.5802 9.13525 12.0102C9.13525 10.4402 10.4216 9.18018 12.0118 9.18018C13.6019 9.18018 14.8579 10.4402 14.8579 12.0102C14.8579 13.5802 13.6019 14.8302 12.0118 14.8302Z" fill="#040415"/>
</svg>
''';

const goldMedalSvgString = '''
<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M4.8407 6.56564C5.67187 5.80064 6.78145 5.3335 8.00014 5.3335C9.21882 5.3335 10.3284 5.80064 11.1596 6.56564L13.2068 2.81235C13.5703 2.14598 13.088 1.3335 12.3289 1.3335H10.118C9.63382 1.3335 9.18766 1.59602 8.9525 2.01931L8.00012 3.7336L7.04773 2.01931C6.81257 1.59602 6.36641 1.3335 5.88219 1.3335H3.67133C2.91227 1.3335 2.42996 2.14598 2.79344 2.81235L4.8407 6.56564Z" fill="#FFCD6D"/>
<path d="M12.6668 10.0002C12.6668 12.5775 10.5775 14.6668 8.00016 14.6668C5.42283 14.6668 3.3335 12.5775 3.3335 10.0002C3.3335 7.42283 5.42283 5.3335 8.00016 5.3335C10.5775 5.3335 12.6668 7.42283 12.6668 10.0002Z" fill="#FEA800"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M7.99984 11.3332C8.73622 11.3332 9.33317 10.7362 9.33317 9.99984C9.33317 9.26346 8.73622 8.6665 7.99984 8.6665C7.26346 8.6665 6.6665 9.26346 6.6665 9.99984C6.6665 10.7362 7.26346 11.3332 7.99984 11.3332Z" fill="#FFCD6D"/>
</svg>
''';

const pointsEarnedSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M11.3465 20.289L11.3465 11.811C11.3465 11.4188 11.662 11.1005 12.0507 11.1005C12.4394 11.1005 12.7549 11.4188 12.7549 11.811L12.7549 20.289C12.7549 20.6812 12.4394 20.9995 12.0507 20.9995C11.662 20.9995 11.3465 20.6812 11.3465 20.289Z" fill="#3BA935"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M6.6511 11.811C6.6511 11.6783 6.68772 11.5476 6.75908 11.432L11.4546 3.9137C11.5842 3.70717 11.8086 3.58117 12.0509 3.58117C12.2931 3.58117 12.5175 3.70717 12.6471 3.9137L17.3427 11.432C17.4788 11.6509 17.4873 11.9275 17.3624 12.1539C17.2384 12.3813 17.0028 12.5215 16.7464 12.5215L7.3553 12.5215C7.09897 12.5215 6.8633 12.3813 6.73936 12.1539C6.68021 12.0469 6.6511 11.9284 6.6511 11.811Z" fill="#3BA935"/>
</svg>
''';

const pointsDeducedSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M12.6535 3.71101V12.189C12.6535 12.5812 12.338 12.8995 11.9493 12.8995C11.5606 12.8995 11.2451 12.5812 11.2451 12.189V3.71101C11.2451 3.3188 11.5606 3.00049 11.9493 3.00049C12.338 3.00049 12.6535 3.3188 12.6535 3.71101Z" fill="#E3524F"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M17.3489 12.189C17.3489 12.3217 17.3123 12.4524 17.2409 12.568L12.5454 20.0863C12.4158 20.2928 12.1914 20.4188 11.9491 20.4188C11.7069 20.4188 11.4825 20.2928 11.3529 20.0863L6.65734 12.568C6.5212 12.3491 6.51275 12.0725 6.63763 11.8461C6.76156 11.6187 6.99723 11.4785 7.25356 11.4785H16.6447C16.901 11.4785 17.1367 11.6187 17.2606 11.8461C17.3198 11.9531 17.3489 12.0716 17.3489 12.189Z" fill="#E3524F"/>
</svg>
''';

const challengeCompletedSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M7.30283 9.84822C8.53848 8.70072 10.188 8 11.9998 8C13.8115 8 15.461 8.70072 16.6967 9.84822L19.7402 4.21828C20.2806 3.21872 19.5635 2 18.4351 2H15.1483C14.4285 2 13.7652 2.39378 13.4156 3.02871L11.9997 5.60016L10.5839 3.02871C10.2343 2.39378 9.57101 2 8.85114 2H5.56442C4.43597 2 3.71895 3.21872 4.25931 4.21828L7.30283 9.84822Z" fill="#FEA800"/>
<path d="M18.9377 15C18.9377 18.866 15.8317 22 12.0001 22C8.16858 22 5.0625 18.866 5.0625 15C5.0625 11.134 8.16858 8 12.0001 8C15.8317 8 18.9377 11.134 18.9377 15Z" fill="#FFE6B6"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M12.0002 17C13.095 17 13.9824 16.1046 13.9824 15C13.9824 13.8954 13.095 13 12.0002 13C10.9055 13 10.0181 13.8954 10.0181 15C10.0181 16.1046 10.9055 17 12.0002 17Z" fill="#FEA800"/>
</svg>
''';

const filterActivitySvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M20.4179 4.89844C21.2416 4.89844 21.9111 5.56214 21.9111 6.37867C21.9111 7.1963 21.2416 7.86 20.4179 7.86H13.901C13.0762 7.86 12.4066 7.1963 12.4066 6.37867C12.4066 5.56214 13.0762 4.89844 13.901 4.89844H20.4179ZM3.58369 15.9581H10.1006C10.9254 15.9581 11.5949 16.6218 11.5949 17.4394C11.5949 18.2559 10.9254 18.9207 10.1006 18.9207H3.58369C2.75889 18.9207 2.08936 18.2559 2.08936 17.4394C2.08936 16.6218 2.75889 15.9581 3.58369 15.9581Z" fill="#CDCDD0"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M5.49758 9.75821C7.38064 9.75821 8.90581 8.24523 8.90581 6.37856C8.90581 4.51298 7.38064 3 5.49758 3C3.61562 3 2.08936 4.51298 2.08936 6.37856C2.08936 8.24523 3.61562 9.75821 5.49758 9.75821ZM18.5029 20.7778C20.386 20.7778 21.9111 19.2648 21.9111 17.3992C21.9111 15.5325 20.386 14.0196 18.5029 14.0196C16.621 14.0196 15.0947 15.5325 15.0947 17.3992C15.0947 19.2648 16.621 20.7778 18.5029 20.7778Z" fill="#040415"/>
</svg>
''';

const runningAchievementSvgString = '''
<svg width="18" height="19" viewBox="0 0 18 19" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 18.26H18V0.26H0V18.26Z" fill="#040415"/>
</svg>
''';

const goldMedalAchievementSvgString = '''
<svg width="18" height="19" viewBox="0 0 18 19" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 18.26H18V0.26H0V18.26Z" fill="#040415"/>
</svg>
''';

const baseColor = Color(0xFFEAECF0);
final highlightColor = const Color(0xFFEAECF0).withOpacity(0.4);