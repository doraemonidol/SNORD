const calendarSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M3.0835 9.25687C3.09622 8.66987 3.14518 7.50487 3.23722 7.12987C3.7072 5.02087 5.30317 3.68087 7.58452 3.48987H16.4162C18.678 3.69087 20.2935 5.03987 20.7635 7.12987C20.8546 7.49487 20.9035 8.66887 20.9162 9.25687H3.0835Z" fill="#040415"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.33767 6.59C8.76848 6.59 9.09159 6.261 9.09159 5.82V2.771C9.09159 2.33 8.76848 2 8.33767 2C7.90686 2 7.58375 2.33 7.58375 2.771V5.82C7.58375 6.261 7.90686 6.59 8.33767 6.59ZM3.08008 16.87V9.257H20.9197V16.931C20.9197 20.07 18.9614 22 15.8282 22H8.16172C5.0579 22 3.08008 20.03 3.08008 16.87ZM7.99527 14.41C7.54487 14.431 7.17281 14.07 7.15323 13.611C7.15323 13.151 7.50571 12.771 7.95611 12.75C8.39671 12.75 8.75899 13.101 8.76878 13.55C8.78836 14.011 8.43588 14.391 7.99527 14.41ZM12.0195 14.41C11.5691 14.431 11.197 14.07 11.1774 13.611C11.1774 13.151 11.5299 12.771 11.9803 12.75C12.4209 12.75 12.7832 13.101 12.793 13.55C12.8126 14.011 12.4601 14.391 12.0195 14.41ZM16.0143 18.09C15.5639 18.08 15.2016 17.7 15.2016 17.24C15.1918 16.78 15.5541 16.401 16.0045 16.391H16.0143C16.4745 16.391 16.8465 16.771 16.8465 17.24C16.8465 17.71 16.4745 18.09 16.0143 18.09ZM11.1774 17.24C11.197 17.7 11.5691 18.061 12.0195 18.04C12.4601 18.021 12.8126 17.641 12.793 17.181C12.7832 16.731 12.4209 16.38 11.9803 16.38C11.5299 16.401 11.1774 16.78 11.1774 17.24ZM7.14343 17.24C7.16302 17.7 7.53508 18.061 7.98548 18.04C8.42608 18.021 8.77857 17.641 8.75899 17.181C8.74919 16.731 8.38692 16.38 7.94631 16.38C7.49592 16.401 7.14343 16.78 7.14343 17.24ZM15.2114 13.601C15.2114 13.141 15.5639 12.771 16.0143 12.761C16.4549 12.761 16.8074 13.12 16.827 13.561C16.8367 14.021 16.4843 14.401 16.0437 14.41C15.5933 14.42 15.2212 14.07 15.2114 13.611V13.601ZM16.4158 5.82C16.4158 6.261 16.0829 6.59 15.6619 6.59C15.2311 6.59 14.908 6.261 14.908 5.82V2.771C14.908 2.33 15.2311 2 15.6619 2C16.0829 2 16.4158 2.33 16.4158 2.771V5.82Z" fill="#CDCDD0"/>
</svg>
''';

const notificationSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M13.9907 19.2284C13.4952 19.1216 10.4762 19.1216 9.9807 19.2284C9.55715 19.3271 9.09912 19.5567 9.09912 20.0603C9.12375 20.5407 9.4025 20.9647 9.78862 21.2336L9.78764 21.2346C10.287 21.6274 10.8731 21.8771 11.4868 21.9668C11.8138 22.0121 12.1467 22.0101 12.4856 21.9668C13.0982 21.8771 13.6843 21.6274 14.1837 21.2346L14.1827 21.2336C14.5689 20.9647 14.8476 20.5407 14.8722 20.0603C14.8722 19.5567 14.4142 19.3271 13.9907 19.2284Z" fill="#040415"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M19.7002 11.6453C18.9762 10.7923 18.6472 10.0531 18.6472 8.79716V8.37013C18.6472 6.73354 18.2739 5.67907 17.4623 4.62459C16.2113 2.98699 14.1054 2 12.0438 2H11.9561C9.93783 2 7.89789 2.94167 6.62526 4.5128C5.76929 5.58842 5.35263 6.68822 5.35263 8.37013V8.79716C5.35263 10.0531 5.04531 10.7923 4.29966 11.6453C3.75101 12.2738 3.57568 13.0815 3.57568 13.9557C3.57568 14.8309 3.86035 15.6598 4.43165 16.3336C5.1773 17.1413 6.23027 17.6569 7.3059 17.7466C8.86319 17.9258 10.4205 17.9933 12.0004 17.9933C13.5794 17.9933 15.1367 17.8805 16.695 17.7466C17.7696 17.6569 18.8226 17.1413 19.5682 16.3336C20.1385 15.6598 20.4242 14.8309 20.4242 13.9557C20.4242 13.0815 20.2489 12.2738 19.7002 11.6453Z" fill="#CDCDD0"/>
</svg>
''';

const congratulationSvgString = '''
<svg width="393" height="392" viewBox="0 0 393 392" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="197" cy="196" r="160.5" stroke="url(#paint0_radial_658_4654)" stroke-width="71" stroke-dasharray="64 64"/>
<mask id="mask0_658_4654" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="142" y="132" width="109" height="128">
<path d="M148 164C148 149.641 159.641 138 174 138H218.444C232.804 138 244.444 149.641 244.444 164V213.776C244.444 219.946 242.312 225.639 238.271 229.639C233.278 234.58 226.38 240.755 218.819 245.677C211.13 250.683 203.452 253.931 196.761 253.999C189.95 254.068 182.102 250.86 174.224 245.834C166.476 240.89 159.396 234.641 154.28 229.643C150.173 225.632 148 219.888 148 213.661V164Z" fill="#FFF4CC" stroke="#FFD533" stroke-width="12"/>
</mask>
<g mask="url(#mask0_658_4654)">
<g filter="url(#filter0_d_658_4654)">
<path d="M142.278 164C142.278 146.327 156.605 132 174.278 132H218.722C236.395 132 250.722 146.327 250.722 164V213.776C250.722 221.298 248.116 228.612 242.77 233.903C232.481 244.086 213.883 259.829 197.099 259.999C180.007 260.171 160.904 244.23 150.365 233.935C144.934 228.631 142.278 221.253 142.278 213.661V164Z" fill="#FFEA99"/>
<path d="M148.278 164C148.278 149.641 159.918 138 174.278 138H218.722C233.082 138 244.722 149.641 244.722 164V213.776C244.722 219.946 242.59 225.639 238.549 229.639C233.556 234.58 226.658 240.755 219.096 245.677C211.408 250.683 203.73 253.931 197.039 253.999C190.228 254.068 182.38 250.86 174.501 245.834C166.753 240.89 159.674 234.641 154.558 229.643C150.451 225.632 148.278 219.888 148.278 213.661V164Z" stroke="#FFCA00" stroke-width="12"/>
</g>
<path d="M196.175 213V187.176L189.455 190.92L187.199 185.256L197.135 179.88H202.943V213H196.175Z" fill="#FEA800"/>
<path opacity="0.16" d="M232.334 126.925L266.526 161.117L174.643 253C174.643 253 161.732 256.418 157.5 254C140 244 131.925 227.334 131.925 227.334L232.334 126.925Z" fill="white"/>
<circle opacity="0.64" cx="161" cy="152" r="4" fill="white"/>
<circle opacity="0.32" cx="229" cy="232" r="4" fill="white"/>
</g>
<defs>
<filter id="filter0_d_658_4654" x="142.278" y="132" width="108.444" height="136" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="8"/>
<feComposite in2="hardAlpha" operator="out"/>
<feColorMatrix type="matrix" values="0 0 0 0 0.8875 0 0 0 0 0.605789 0 0 0 0 0.0554687 0 0 0 1 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_658_4654"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_658_4654" result="shape"/>
</filter>
<radialGradient id="paint0_radial_658_4654" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(197 196) rotate(90) scale(196 196)">
<stop stop-color="white" stop-opacity="0.48"/>
<stop offset="1" stop-color="white" stop-opacity="0"/>
</radialGradient>
</defs>
</svg>
''';