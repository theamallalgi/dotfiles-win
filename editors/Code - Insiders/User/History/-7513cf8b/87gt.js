// Preloader, GSAP (Green sock animation platform) & Animations
gsap.registerPlugin(ScrollTrigger);
let tl = gsap.timeline();

// GSAP
tl.from('.nav_cont', {
  y: '-200%',
  duration: 0.5
});

const preloader = document.querySelector('.preloader');
const preloaderMessage = document.querySelector('.preloader .yoka')

window.addEventListener('load', () => {
  document.body.style.pointerEvents = 'auto'; // Re-enable Pointer Events
  document.body.style.overflow = 'auto'; // Re-enable scrolling
  document.body.setAttribute("data-state", 'loaded');
})

window.addEventListener('load', () => {
  document.querySelectorAll(".animated-txt").forEach((element) => {
    animateText(element, 40);
  });
})

// Blur reveal on Scroll
gsap.utils.toArray('.section').forEach((section, index) => { // Iterate through each section
  gsap.from(section, {
    scrollTrigger: {
      trigger: section,
      start: 'top 90%', // top of the elem at 90% of the vh
      end: 'top 30%', // top of the elem at 20% of the vh
      scrub: 1, // Smooth scrolling effect
    },
    filter: 'blur(0.5rem)',
    ease: 'power4.out',
  });
});

// Imports
accentColorSwitch = document.querySelectorAll('.clr_changer');

// Navbar Auto Hide
let lastScrollTop = 0;
const navbar = document.querySelector('nav');
const navHeight  = navbar.offsetHeight;
document.documentElement.style.setProperty('--scroll-padding', navHeight + 'px');

window.addEventListener('scroll', function() {
  let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
  if (scrollTop > lastScrollTop) { // Scrolling down
    navbar.classList.add('hidden');
  } else { navbar.classList.remove('hidden'); } // Scrolling up
  lastScrollTop = scrollTop <= 0 ? 0 : scrollTop; // For Mobile or negative scrolling
});

// Tooltip and Info Dialog
const showTooltip = (message) => {
  // Create a new tooltip element
  var tooltip = document.createElement("div");
  tooltip.id = "tooltip";
  tooltip.textContent = message;

  // Append the tooltip to the body
  document.body.appendChild(tooltip);

  // Trigger a reflow to enable the transition
  void tooltip.offsetWidth;

  // Show the tooltip
  tooltip.style.opacity = 1;
  tooltip.style.transform = "translateX(0%) translateY(0)";

  // Hide the tooltip after 2 seconds
  setTimeout(function() {
    // Fade out the tooltip
    tooltip.style.opacity = 0;
    tooltip.style.transform = "translateX(0%) translateY(100%)";

    // Remove the tooltip from the DOM after fading out
    setTimeout(function() {
      document.body.removeChild(tooltip);
    }, 300);
  }, 2000);
}

// Random Accent Color Generator
//  Colors
const colorMapping = {
  '#f71a1a': 'red',
  '#ff9900': 'yellow',
  '#0ac87e': 'green',
  '#375fff': 'blue',
  '#a126f9': 'purple',
  '#00cdb9': 'cyan',
  
};

const randomAccentColor = () => {
  function getRandomColor() {
    const colorKeys = Object.keys(colorMapping);
    const randomIndex = Math.floor(Math.random() * colorKeys.length);
    return colorKeys[randomIndex];
  }

  const randomColor = getRandomColor(); // The Random Color Value (Hex)
  let glyphImgs = document.querySelectorAll('img.glyph');
  let navLogo = document.querySelector('.nav_logo');
  let navMenu = document.querySelector('.nav_ham_menu');
  let randomBackdrop = document.querySelector('img.random_backdrop');

  document.documentElement.style.setProperty('--acc', randomColor); // sets the accent color
  const folderName = colorMapping[randomColor];
  arrowPath = `url(../../assets/images/dependencies/${folderName}/arrow-bg.png)`
  document.documentElement.style.setProperty('--crs-loc', arrowPath); // sets the accent color
  randomBackdrop.src = `assets/images/boards/backdrops/${folderName}.png`

  glyphImgs.forEach(imgs => {
    const folderName = colorMapping[randomColor];
    const dataValue = imgs.getAttribute('data-img');
    let glyphPath =  `./assets/images/dependencies/${folderName}/${dataValue}.png`;
    imgs.src = glyphPath;
    // console.log(glyphPath);
  });
  return randomColor;
};
randomAccentColor();

// Accent Color Switch Buttons
accentColorSwitch.forEach((accSwitch) => {
  accSwitch.addEventListener('dblclick', () => {
    randomAccentColor();
    // Tooltip to indicate accent color change
    realtimeRandomColor = randomAccentColor();
    const realTimeColorName = colorMapping[realtimeRandomColor];
    showTooltip(`accent color changed to ${realTimeColorName} *`);
    isEasterEgg('Accent Colors');
  })
});

document.addEventListener("DOMContentLoaded", () => {
  // Check if the user's device prefers dark mode
  const prefersDarkMode = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
  const themeGlyph = document.querySelector('.nav_menu .tools .theme img');

  // Retrieve the stored theme from local storage
  const storedTheme = localStorage.getItem('theme');
  const initialTheme = storedTheme || (prefersDarkMode ? 'dark' : 'light');
  storedAccentColor = randomAccentColor();

  // Set initial theme based on user's preference or stored theme
  const body = document.body;
  const footerLogo = document.querySelector('footer .right img');
  const accordionArrows = document.querySelectorAll('.accordion .accordion-item .accordion-header img');
  body.setAttribute("data-theme", initialTheme);

  // Set initial img src based on the initial theme
  if (initialTheme === 'dark') {
    themeGlyph.setAttribute("data-img", 'moon2');
    themeGlyph.src = `assets/images/dependencies/${colorMapping[storedAccentColor] || 'red'}/moon2.png`;
    footerLogo.src = `assets/images/dependencies/white/icon-s.png`;
    accordionArrows.forEach((arrow) => { arrow.src = `assets/images/dependencies/white/arrow-alt-med.png`; });
  } else {
    themeGlyph.setAttribute("data-img", 'sun');
    themeGlyph.src = `assets/images/dependencies/${colorMapping[storedAccentColor] || 'red'}/sun.png`;
    footerLogo.src = `assets/images/dependencies/black/icon-s.png`;
    accordionArrows.forEach((arrow) => { arrow.src = `assets/images/dependencies/black/arrow-alt-med.png`; });
  }

  const switchTheme = () => {
    const currentTheme = body.getAttribute("data-theme");
    const newTheme = currentTheme === "dark" ? "light" : "dark";
    body.setAttribute("data-theme", newTheme);
    showTooltip(`Switched to ${newTheme} theme.`);

    // Set img src based on the new theme
    const imgData = newTheme === 'dark' ? 'moon2' : 'sun';
    themeGlyph.setAttribute("data-img", imgData);
    themeGlyph.src = `assets/images/dependencies/${colorMapping[storedAccentColor] || 'red'}/${imgData}.png`;

    if (newTheme == 'light') {
      footerLogo.src = `assets/images/dependencies/black/icon-s.png`;
      accordionArrows.forEach((arrow) => { arrow.src = `assets/images/dependencies/black/arrow-alt-med.png`; });
    } else {
      footerLogo.src = `assets/images/dependencies/white/icon-s.png`;
      accordionArrows.forEach((arrow) => { arrow.src = `assets/images/dependencies/white/arrow-alt-med.png`; });
    }
    
    // Store the updated theme in local storage
    localStorage.setItem('theme', newTheme);
  };

  window.toggleTheme = () => { switchTheme(); }; // Function to toggle between dark and light modes

  document.querySelectorAll('.theme').forEach((clicker) => {
    clicker.addEventListener('click', () => {
      switchTheme();
      clickSix.play();
    })
  });
});

// Time Greeter
function updateGreeting() {
  const currentDate = new Date();
  const currentHour = currentDate.getHours(); // 0000 = Midnight (24HRS)
  let greeting = '';

  if (currentHour >= 0 && currentHour < 1) {
    greeting = "Lil' Night Owl,"; // Displays from 0000 to 0100;
  } else if (currentHour >= 1 && currentHour < 5) {
    greeting = "Early Bird,"; // Displays from 0100 to 0500;
  } else if (currentHour >= 5 && currentHour < 12) {
    greeting = "Good Mornin'"; // Displays from 0500 to 1200;
  } else if (currentHour >= 12 && currentHour < 18) {
    greeting = "Good Aft'rnoon"; // Displays from 1200 to 1800;
  } else {
    greeting = "Good Evenin'"; // Displays from 1800 to 0000;
  }

  const greetingElement = document.querySelector('h1.greeting');
  if (greetingElement) {
    greetingElement.textContent = greeting;
  }
}; updateGreeting(); // Call the function initially to set the greeting
setInterval(updateGreeting, 60000); // Update the greeting every minute to reflect the current time

// Navigation Menu
const menuButton = document.querySelector('nav .menu.link.menu_btn');
const menu = document.querySelector('.nav_menu');
const navLis = document.querySelectorAll('.nav_menu ul.nav_links li');
const animatedTextElements = document.querySelectorAll('.fun-link')

const navMenuDisplay = () => {
  if (menu.classList.contains('open')) {
    menu.classList.remove('open');
    menuButton.classList.remove('open');
    document.body.style.overflow = 'auto'; // Enable scrolling
  } else {
    menu.classList.add('open');
    menuButton.classList.add('open');
    if (navbar.classList.contains('hidden')) { navbar.classList.remove('hidden'); }
    document.body.style.overflow = 'hidden'; // Disable scrolling

    setTimeout(() => {
      animatedTextElements.forEach((element) => {
        animateText(element, 60);
      });
    }, 100);
  }
}
menuButton.addEventListener('click', () => { navMenuDisplay(); clickThree.play(); });
navLis.forEach((navLi) => { navLi.addEventListener('click', () => { navMenuDisplay(); }); });

// Keyboard Shortcuts
document.addEventListener('keydown', (event) => {
  if (event.ctrlKey && event.key === 'm') { // Ctrl+m opens the Navigation Menu
    clickThree.play();
    navMenuDisplay();
  }
  if (event.shiftKey && event.key === 'P') { // Shift+P reloads the pokemon
    clickTwo.play();
    pokeClickers.forEach((clicker) => {
      const container = clicker.closest('.poke_counter');
      if (container) { loadImagesSequentially(container);}
    });
  }
});

// Easter Egg Image Touch to Copy Function
copyBtnElements = document.querySelectorAll('.copy_btn');
copyBtnElements.forEach((copyElement) => {
  copyElement.addEventListener('click', function() {
    const textToCopy = this.getAttribute('data-copy');
    const textarea = document.createElement('textarea');
    textarea.setAttribute('id', 'bozon-1')
    textarea.value = textToCopy;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
    showTooltip(`Somethin' was copied!`);
    isEasterEgg('Copy Clicks');
  });
});

// Entermouth Form Submit
let submitForm = (event) => { event.preventDefault(); }

// To get the current time (Footer Element)
const currentDate = new Date();
const currentYear = currentDate.getFullYear();

// Standard Time Zones
const optionsIST = { timeZone: 'Asia/Kolkata', hour: '2-digit', hour12: false, minute: '2-digit' }; // IST
const optionsEST = { hour: '2-digit', minute: '2-digit', hour12: false, timeZone: 'America/New_York' }; // EST
const optionsCET = { timeZone: 'Europe/Berlin', hour: '2-digit', hour12: false, minute: '2-digit' }; // CET/CEST

const currentTimeIST = currentDate.toLocaleTimeString('en-IN', optionsIST);
const currentTimeEST = currentDate.toLocaleTimeString('en-US', optionsEST);
const currentTimeCET = currentDate.toLocaleTimeString('en-DE', optionsCET);

document.querySelector('footer .left p.year').textContent = `@${currentYear}`;
document.querySelector('footer .left p.time').textContent = `[${currentTimeIST} IST/${currentTimeCET} CET]`;

// ACCORDION (SKILLS SECTION)
const accordionItems = document.querySelectorAll('.accordion-item');

accordionItems.forEach(item => {
  const header = item.querySelector('.accordion-header');

  header.addEventListener('click', () => {
    item.classList.toggle('active'); // Toggle the active class to expand/collapse the accordion
    accordionItems.forEach(otherItem => {  // Close other accordion items when one is opened
      if (otherItem !== item && otherItem.classList.contains('active')) {
        otherItem.classList.remove('active');
      }
    });
  });
});

// Random Pokemon Image Generator
const pokeClickers = document.querySelectorAll('.pokeClick');
const totalImages = 151; // Total number of images you have
const EnterMouthInputField = document.querySelector('.enterMouthArea');
const EnterMouthSubmit = document.querySelector('.enterMouthBtn');

const originalPokemon = [
    'Bulbasaur', 'Ivysaur', 'Venusaur', 'Charmander', 'Charmeleon', 'Charizard',
    'Squirtle', 'Wartortle', 'Blastoise', 'Caterpie', 'Metapod', 'Butterfree',
    'Weedle', 'Kakuna', 'Beedrill', 'Pidgey', 'Pidgeotto', 'Pidgeot',
    'Rattata', 'Raticate', 'Spearow', 'Fearow', 'Ekans', 'Arbok',
    'Pikachu', 'Raichu', 'Sandshrew', 'Sandslash', 'Nidoran-F', 'Nidorina', 'Nidoqueen',
    'Nidoran-M', 'Nidorino', 'Nidoking', 'Clefairy', 'Clefable', 'Vulpix',
    'Ninetales', 'Jigglypuff', 'Wigglytuff', 'Zubat', 'Golbat', 'Oddish',
    'Gloom', 'Vileplume', 'Paras', 'Parasect', 'Venonat', 'Venomoth', 'Diglett',
    'Dugtrio', 'Meowth', 'Persian', 'Psyduck', 'Golduck', 'Mankey', 'Primeape',
    'Growlithe', 'Arcanine', 'Poliwag', 'Poliwhirl', 'Poliwrath', 'Abra', 'Kadabra',
    'Alakazam', 'Machop', 'Machoke', 'Machamp', 'Bellsprout', 'Weepinbell', 'Victreebel',
    'Tentacool', 'Tentacruel', 'Geodude', 'Graveler', 'Golem', 'Ponyta', 'Rapidash',
    'Slowpoke', 'Slowbro', 'Magnemite', 'Magneton', 'Farfetch\'d', 'Doduo', 'Dodrio',
    'Seel', 'Dewgong', 'Grimer', 'Muk', 'Shellder', 'Cloyster', 'Gastly',
    'Haunter', 'Gengar', 'Onix', 'Drowzee', 'Hypno', 'Krabby', 'Kingler',
    'Voltorb', 'Electrode', 'Exeggcute', 'Exeggutor', 'Cubone', 'Marowak', 'Hitmonlee',
    'Hitmonchan', 'Lickitung', 'Koffing', 'Weezing', 'Rhyhorn', 'Rhydon', 'Chansey',
    'Tangela', 'Kangaskhan', 'Horsea', 'Seadra', 'Goldeen', 'Seaking', 'Staryu',
    'Starmie', 'Mr.Mime', 'Scyther', 'Jynx', 'Electabuzz', 'Magmar', 'Pinsir',
    'Tauros', 'Magikarp', 'Gyarados', 'Lapras', 'Ditto', 'Eevee', 'Vaporeon',
    'Jolteon', 'Flareon', 'Porygon', 'Omanyte', 'Omastar', 'Kabuto', 'Kabutops',
    'Aerodactyl', 'Snorlax', 'Articuno', 'Zapdos', 'Moltres', 'Dratini', 'Dragonair',
    'Dragonite', 'Mewtwo', 'Mew'
]; // The Original 151 Pokemon Names according to the National Dex order

const getRandomImagePath = () => {
  const randomIndex = Math.floor(Math.random() * totalImages);
  const paddedIndex = String(randomIndex + 1);
  const randomName = originalPokemon[randomIndex]; // Generating a random Name from the list
  const randomLevel = Math.floor(Math.random() * 100); // Generating a random level under 100
  const randomPath = `./assets/images/sprites/og-151-c/${paddedIndex}.png`;
  return {
      cName: () => randomName,
      cPath: () => randomPath,
      cLevel: () => randomLevel,
  };
}; getRandomImagePath();

let pokemonJackpotNamesList = [];

const loadImagesSequentially = (container) => {
  const pokeImgCont = container.querySelectorAll('.poke_img img');
  let index = 0;

  const loadNextImage = () => {
    if (index < pokeImgCont.length) {
      const { cPath, cLevel, cName } = getRandomImagePath();
      pokeLvl = cLevel();
      pokeName = cName();
      pokePath = cPath();
      pokeImgCont[index].src = pokePath;
      index++;
      pokemonJackpotNamesList.push({ names: pokeName, levels: pokeLvl, paths: pokePath });
      // Check if all four Pokemon are the same
      if (index === pokeImgCont.length && pokemonJackpotNamesList.every(pokemon => pokemon.names === pokeName)) {
        const jackpotChance = Math.floor(Math.random() * 50) === 0; // 1 in 50 chance
        if (jackpotChance) {
          // Increment and store 'jackpots' count in local storage
          const jackpotsCount = parseInt(localStorage.getItem('jackpots') || 0, 10) + 1;
          localStorage.setItem('jackpots', jackpotsCount);
        }
      }; setTimeout(loadNextImage, 100);
    }
  };
  pokemonJackpotNamesList = []; // Reset pokemonJackpotNamesList here before starting to load images
  loadNextImage();
};

const pokeJackpot = () => {
  pokeClickers.forEach((clicker) => {
    clicker.addEventListener('click', () => {
      const container = clicker.closest('.poke_counter');
      if (container) { loadImagesSequentially(container); }
    });
  });
}; pokeJackpot();

// The EnterMouth Nuggets
const enterMouthValue = document.querySelector('.entermouth form.fun input.enterMouthArea');
const enterMouthBtn = document.querySelector('.entermouth form.fun input.enterMouthBtn');
const outputParagraph = document.querySelector('.output-tab p');

// To clear the EnterMouth Values on click
enterMouthValue.addEventListener('click', () => { enterMouthValue.value = ''; })
// The Codes and Fun Stuff to enter
enterMouthBtn.addEventListener('click', () => {
  const processedText = enterMouthValue.value.toLowerCase().replace(/[^a-z\s]/g, '');
  switch (processedText !== '') {
    // Catch a Pokemon 🪐
    case processedText.startsWith('catch '):
      const catchIndex = processedText.indexOf('catch');
      if (catchIndex !== -1) {
          const capturedWord = processedText.substring(catchIndex + 'catch'.length).trim().toLowerCase().replace(/[^a-z\s]/g, '');
          const foundPokemon = pokemonJackpotNamesList.find((pokemonjackpotName) => {
              const PokemonName = pokemonjackpotName.names;
              const PokemonLvl = pokemonjackpotName.levels;
              const PokemonPath = pokemonjackpotName.paths;
              const cleanedPokemonName = PokemonName.toLowerCase().replace(/[^a-z\s]/g, '');
              return cleanedPokemonName === capturedWord;
          });

          if (capturedWord === "") {
              outputParagraph.textContent = `Forgot the Pokemon's Name?`;
          } else if (foundPokemon) {
              const newPokemonName = foundPokemon.names;
              const newPokemonLevel = foundPokemon.levels;
              const newPokemonPath = foundPokemon.paths;

              const capturedPokemon = {
                  name: newPokemonName,
                  level: newPokemonLevel,
                  path: newPokemonPath,
              };

              const localStorageKey = 'pokeParty';
              const existingCapturedPokemons = JSON.parse(localStorage.getItem(localStorageKey)) || [];

              if (existingCapturedPokemons.length < 6) {
                  // Add the new Pokémon to the party
                  existingCapturedPokemons.push(capturedPokemon);
                  localStorage.setItem(localStorageKey, JSON.stringify(existingCapturedPokemons));
                  outputParagraph.textContent = `Caught a lvl ${newPokemonLevel} ${newPokemonName}!`;
              } else {
                  // Party is full, display a message
                  outputParagraph.textContent = 'Your party is full! Release a Pokémon to make space.';
              }
          } else {
              outputParagraph.textContent = `${capturedWord} is nowhere to be found!`;
          }
      }
      break;

    // Display the party 🪐
    case processedText == 'show party':
      function getCaughtPokemons() { // a function to get the caught Pokémon from local storage
        return JSON.parse(localStorage.getItem('pokeParty')) || [];
      }
      function showPokemonParty() { // Function to display Pokémon cards
        const caughtPokemons = getCaughtPokemons();
        if (caughtPokemons.length === 0) {
          outputParagraph.textContent = 'No Pokémon in your party.';
          return;
        }
        outputParagraph.innerHTML = ''; // Clear existing content
        caughtPokemons.forEach((pokemon) => { // Create and append cards for each caught Pokémon
          const card = document.createElement('div');
          card.classList.add('pokemon-card');
          card.innerHTML = `
            <img src="${pokemon.path}" alt="pokemon">
            <h3>${pokemon.name}</h3>
            <p>Lvl: ${pokemon.level}</p>
          `;
          outputParagraph.appendChild(card);
        });
      }; showPokemonParty();
      break;

    // Delete a Pokemon Party 🪐
    case processedText == 'delete party':
      localStorage.removeItem('pokeParty'); // Remove the key from local storage
      outputParagraph.textContent = 'Your Pokemon Party was deleted!';
      break;

    // Release a Pokemon 🪐
    case processedText.startsWith('release '):
      const releaseIndex = processedText.indexOf('release');
      if (releaseIndex !== -1) {
          const releasedWord = processedText.substring(releaseIndex + 'release'.length).trim().toLowerCase().replace(/[^a-z\s]/g, '');
          const localStorageKey = 'pokeParty';
          let existingCapturedPokemons = JSON.parse(localStorage.getItem(localStorageKey)) || [];

          // Find the index of the released Pokémon in the party
          const releasedPokemonIndex = existingCapturedPokemons.findIndex((pokemon) => {
              return pokemon.name.toLowerCase().trim().replace(/[^a-z\s]/g, '') === releasedWord;
          });

          if (releasedPokemonIndex !== -1) {
              // Remove the released Pokémon from the party
              const releasedPokemon = existingCapturedPokemons.splice(releasedPokemonIndex, 1)[0];

              // Update local storage with the modified party
              localStorage.setItem(localStorageKey, JSON.stringify(existingCapturedPokemons));

              outputParagraph.textContent = `Released ${releasedPokemon.name} from your party!`;
          } else {
              if (releasedWord.trim() === "") {
                  outputParagraph.textContent = `Forgot the Pokemon's Name?`;
              } else {
                  outputParagraph.textContent = `No Pokémon named ${releasedWord} found in your party!`;
              }
          }
      }
      break;

    // Daily Coins 🪐
    case processedText.toLowerCase() === 'daily':
      addDailyCoins();
      break;

    // Show Coins 🪐
    case processedText.toLowerCase() === 'show coins':
      const currentCoinCount = getCoinCount(); // Retrieve the current coin count
      showTooltip(`You have ${currentCoinCount} coins.`);
      break;

    // Surfin' Bird
    case processedText.toLowerCase() === 'bird':
      musicFour.play();
      showTooltip(`Haven't you heard about the Word?`);
      outputParagraph.textContent = `All hail the Bird! 🐦`;
      isEasterEgg('Bird')
      break;

    // Paranoid Theme
    case processedText.toLowerCase() === 'elvis' || 'music':      
      musicSix.play();
      showTooltip(`Elvis has left the building!`);
      isEasterEgg('Elvis Tribute');
      break;

    // Paranoid Theme
    case processedText.toLowerCase() === 'paranoid':
      document.body.setAttribute("data-theme", 'paranoid');
      document.querySelector('footer .right img').src = `assets/images/dependencies/purple/icon-s.png`;
      document.querySelectorAll('.accordion .accordion-item .accordion-header img').forEach((arrow) => { arrow.src = `assets/images/dependencies/purple/arrow-alt-med.png`; });
      showTooltip(`We are now in Paranoia.`);
      isEasterEgg('Paranoia');
      break;

    // The help command 🪐
    case processedText.toLowerCase() === 'help':
      outputParagraph.innerHTML = ''; // Clear existing content
      const helpTab = document.createElement('div');
      helpTab.classList.add('help-tab');
      helpTab.innerHTML = `
        <h2>Available Commands</h2>
        <h3>* Pokemon Commands</h3>
        <ul>
          <li>'show party': Display your current party.</li>
          <li>'catch [pokemonName]': Catch a Pokémon.</li>
          <li>'delete party': Delete your entire party.</li>
          <li>'release [pokemonName]': Release a Pokémon from your party.</li>
          <li>'jackpot': click the pokemon to reload, get 4 of the same pokemon to win!</li>
        </ul>
        <h3>* Coins</h3>
        <ul>
          <li>'show coins': Show current Coins (or visit navbar).</li>
          <li>'daily': Get 200 coins everyday.</li>
        </ul>
      `;
      outputParagraph.appendChild(helpTab);
      break;

    // Default Message 🪐
    default:
      outputParagraph.textContent = "Not that Lucky! 😝";
      break;
  }
})

// The Text Revel and Hover Animation
const letters = "愛和美静明夢華心幸雅信勇知空海桜風火水木石金銀月日闘";
// const letters = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz";

const animateText = (element, customAnimationDuration = 50) => {
  let interval = null;

  const originalText = element.dataset.animatedtxt.trim();
  const animationDuration = originalText.length * customAnimationDuration;
  const durationPerCharacter = animationDuration / originalText.length;
  let iteration = 0;

  clearInterval(interval);

  interval = setInterval(() => {
    if (iteration >= originalText.length + 1) {
      clearInterval(interval);
      return;
    }
    element.innerText = originalText
      .split("")
      .map((letter, index) => (index < iteration ? originalText[index] : letters[Math.floor(Math.random() * 26)]))
      .join("");

    iteration++;
  }, durationPerCharacter);
};

const hoverEffect = (event) => animateText(event.target, 15);

document.querySelectorAll(".fun-link").forEach((link) => { // for all elements (.fun-link) to animate on hover
  link.addEventListener("mouseover", hoverEffect);
  link.addEventListener("mouseout", () => {
    // Reset the text when mouse leaves
    link.innerText = link.dataset.animatedtxt.trim();
  });
});

// Coin Clicker and Counter
const updateCoinCount = (count) => { localStorage.setItem('coinCount', count); }; // Function to update the coin count in local storage
const getCoinCount = () => { return parseInt(localStorage.getItem('coinCount')) || 0; }; // Function to retrieve the coin count from local storage

// Function to handle the click event on the coin clicker
const addCoins = (customCoinCount = 0) => {
  let coinCount = customCoinCount > 0 ? customCoinCount : 1; // Use customCoinCount if greater than 0, else use default of 1
  // Add the coin count to the existing count in local storage
  coinCount += getCoinCount();
  updateCoinCount(coinCount); // Update the coin count in local storage
  return coinCount; // Return the updated coin count
};

const coinClicker = document.querySelector('.tool_link.coin'); // Add click event listener to the coin clicker element
coinClicker.addEventListener('click', () => {
  const currentCoinCount = getCoinCount(); // Retrieve the current coin count
  showTooltip(`You have ${currentCoinCount} coins.`);
});

// Daily Coins
const addDailyCoins = () => {
  const currentDate = new Date().toLocaleDateString();
  const lastClaimedDate = localStorage.getItem('lastClaimedDate');
  if (lastClaimedDate !== currentDate) {
    const currentCoinCount = getCoinCount();
    const newCoinCount = currentCoinCount + 200;
    updateCoinCount(newCoinCount);
    localStorage.setItem('lastClaimedDate', currentDate);
    showTooltip(`Added 200 coins. Total coins: ${newCoinCount}`);
  } else {
    showTooltip('Coins already claimed today.');
  }
};

// Check and Unlock Easter eggs
const easterEggList = ['Accent Colors', 'Copy Clicks', 'Footer Music', 'Bird', 'Paranoia', 'Elvis Tribute', 'Egg7'];

const isEasterEgg = (eggName) => {
  const unlockedEggs = JSON.parse(localStorage.getItem('unlockedEggs')) || {};
  if (easterEggList.includes(eggName) && !unlockedEggs[eggName]) {
    // Easter egg exists and has not been unlocked
    unlockedEggs[eggName] = true;
    // Increment and update the count in local storage
    const currentEggCount = getEggCount();
    const newEggCount = currentEggCount + 1;
    updateEggCount(newEggCount);
    // Update the unlocked eggs in local storage
    localStorage.setItem('unlockedEggs', JSON.stringify(unlockedEggs));
    showTooltip(`Unlocked ${eggName}! Total Easter eggs: ${newEggCount}`);
    addCoins(100);
  } else {
    console.log(`[browser]: '${eggName || 'feature'}' already unlocked or doesn't exist.\n[you]: ¯\\_(ツ)_/¯`);
  }
};

// Function to retrieve the current egg count from local storage
const getEggCount = () => { return parseInt(localStorage.getItem('eggCount')) || 0; };
const easterEggClicker = document.querySelector('.tool_link.egg'); // Add click event listener to the coin clicker element
easterEggClicker.addEventListener('click', () => {
  const currentEggCount = getEggCount(); // Retrieve the current coin count
  showTooltip(`You have unlocked ${currentEggCount}/${easterEggList.length} Easter Eggs.`);
});

// Function to update the egg count in local storage
const updateEggCount = (count) => { localStorage.setItem('eggCount', count); };
// isEasterEgg('Egg3'); // Example usage: Check and unlock Easter Egg 3

// What Click (NAV MENU)
const whatClicker = document.querySelector('.tool_link.question'); // Add click event listener to the coin clicker element
let responses = [
  `Press 'Ctrl+m' to open the Menu`,
  `Press 'Shift+P' to reset all Pokemon`,
  `click Me to find fun Tips`,
  `Find the secret Word!`,
  `There is a Light-mode too!`,
  `Find all the 7 Easter-Eggs!`,
  `Claim Coins Daily`,
  `Double click some stuff!`,
  `Find my favorite singer.`,
  `Unlock Eggs to get Coins`,
  `Try translating stuff`,
];

const randomResponses = () => {
  const randomIndex = Math.floor(Math.random() * responses.length);
  return responses[randomIndex];
};

whatClicker.addEventListener('click', () => {
  let randomResponse = randomResponses();
  showTooltip(randomResponse);
});

// Audio Stuff
let clickOne = new Audio('./assets/audio/dum-(2).wav');
let clickTwo = new Audio('./assets/audio/dum-(1).wav');
let clickThree = new Audio('./assets/audio/dum-(3).wav');
let clickFour = new Audio('./assets/audio/dum-(4).wav');
let clickFive = new Audio('./assets/audio/dum-(5).wav');
let clickSix = new Audio('./assets/audio/click-(6).mp3');
let clickSeven = new Audio('./assets/audio/click-(7).mp3');
let loadOne = new Audio('./assets/audio/load-(1).wav');
let profileOne = new Audio('./assets/audio/profile-(1).mp3');
let profileTwo = new Audio('./assets/audio/profile-(2).mp3');
let musicOne = new Audio('./assets/audio/music/Valley\ of\ the\ Moon\ -\ Svvn.mp3');
let musicTwo = new Audio('./assets/audio/music/Symphony\ No.\ 5.mp3');
let musicThree = new Audio('./assets/audio/music/Symphony\ No\ 9\ From\ the\ New\ World\ IV.mp3');
let musicFour = new Audio('./assets/audio/music/Surfin-Bird.mp3');
let musicFive = new Audio('./assets/audio/music/therickman.mp3');
let musicSix = new Audio('./assets/audio/music/suspicious-minds.mp3');
let musicSeven = new Audio('./assets/audio/music/the-wonder-of-you.mp3');

// Store all audio elements in an array
let allAudioElements = [
  clickOne, clickTwo, clickThree, clickFour, clickFive, clickSix,
  loadOne, profileOne, profileTwo, musicOne, musicTwo, musicThree, musicFour, musicFive, musicSix, musicSeven,
];

let musicTracks = [
  { audio: musicSeven, name: 'The Wonder of You' },
  { audio: musicOne, name: 'Valley of the Moon' },
  { audio: musicThree, name: 'Symphony No. 9' },
  // { audio: musicTwo, name: 'Symphony No. 5' },
];

// Add click event listener to each .click element
document.querySelectorAll('.aud-click-one, a').forEach((element) => { element.addEventListener('click', () => { clickOne.play(); }); });
document.querySelectorAll('.aud-click-two').forEach((element) => { element.addEventListener('click', () => { clickTwo.play(); }); });
document.querySelectorAll('.aud-click-three').forEach((element) => { element.addEventListener('click', () => { clickThree.play(); }); });
document.querySelectorAll('.aud-click-four').forEach((element) => { element.addEventListener('click', () => { clickFour.play(); }); });
document.querySelectorAll('.aud-click-five').forEach((element) => { element.addEventListener('click', () => { clickFive.play(); }); });
document.querySelectorAll('.aud-click-seven').forEach((element) => { element.addEventListener('click', () => { clickSeven.play(); }); });
document.querySelectorAll('.aud-load-one').forEach((element) => { element.addEventListener('click', () => { loadOne.play(); }); });

let currentTrackIndex = 0; // Variable to keep track of the current track
const musicInfo = document.querySelector('footer .right p.music');

const toggleAudio = () => {
  const currentTrack = musicTracks[currentTrackIndex].audio;
  const currentTrackName = musicTracks[currentTrackIndex].name;
  if (!currentTrack || currentTrack.paused) {
    // profileTwo.play();
    currentTrack.play(); // If audio is paused or not started, play the current track
    musicInfo.textContent = `(${currentTrackName})`;
  } else {
    profileTwo.play();
    currentTrack.currentTime = 0; // If audio is playing, pause and reset
    currentTrack.pause();
    currentTrackIndex = (currentTrackIndex + 1) % musicTracks.length; // Increment currentTrackIndex to switch to the next track
    musicInfo.textContent = `(paused)`;
  }
  isEasterEgg('Footer Music');
};

const musicClicker = document.querySelectorAll('.music_player');
musicClicker.forEach(player => {
  player.addEventListener('click', () => {
    toggleAudio();
  });
});

storedAccentColor = randomAccentColor();

// Function to mute or unmute all audio elements and save the state to localStorage
const toggleMute = () => {
  const isMuted = localStorage.getItem('isMuted') === 'true';

  allAudioElements.forEach(audio => { 
    audio.currentTime = 0; 
    audio.pause();
    audio.muted = !isMuted; 
  });

  const newMuteState = !isMuted;
  localStorage.setItem('isMuted', newMuteState.toString());

  const muteButtonImageSrc = `./assets/images/dependencies/${colorMapping[storedAccentColor]}/music-${newMuteState ? '2' : '1'}.png`;

  document.querySelector('.mute img').src = muteButtonImageSrc;

  showTooltip(`All audio ${newMuteState ? 'muted' : 'unmuted'}.`);
};

const isMuted = localStorage.getItem('isMuted');
const storedTheme = localStorage.getItem('theme');
muteGlyph = document.querySelector('.nav_menu .tools .mute img');

if (isMuted === 'true') {
  muteGlyph.setAttribute("data-img", 'music-2');
  muteGlyph.src = `assets/images/dependencies/${colorMapping[storedAccentColor] || 'red'}/music-2.png`;
  showTooltip(`All audio muted. (see menu)`)
} else {
  muteGlyph.setAttribute("data-img", 'music-1');
  muteGlyph.src = `assets/images/dependencies/${colorMapping[storedAccentColor] || 'red'}/music-1.png`;
}

// Mute Button
document.querySelectorAll('.mute').forEach((btn) => {
  btn.addEventListener('click', () => {
    toggleMute();
  });
});


// Secret Holiday Wisher
const calculateOnamDate = () => { // Calculate Onam every Year
  const adjustDateForLunar = (date) => {
    // Add your lunar calendar adjustments here
    // For simplicity, this example just returns the input date
    return date;
  }
  const formatAsMMDD = (date) => {
      const month = (date.getMonth() + 1).toString().padStart(2, '0');
      const day = date.getDate().toString().padStart(2, '0');
      return `${month}-${day}`;
  }
  const currentYear = new Date().getFullYear();
  const malayalamYear = currentYear + 1182; // Offset to Malayalam Era (ME)
  // Estimate Chingam 1 (solar calendar approximation)
  const chingam1Estimate = new Date(currentYear, 7, 16);
  // Adjust the date based on lunar calculations (Nakshatra)
  const chingam1Actual = adjustDateForLunar(chingam1Estimate);
  // Onam is typically celebrated on Thiruonam, which is the 10th day of Chingam
  const onamDate = new Date(chingam1Actual.getFullYear(), chingam1Actual.getMonth(), chingam1Actual.getDate() + 9);
  return formatAsMMDD(onamDate);
}

const holidays = [
    { name: 'New Year\'s Day', date: '01-01', response: `Happy <span class='special'>New Year</span>!` },
    { name: 'Valentine\'s Day', date: '02-14', response: `Happy <span class='special'>Valentine\'s</span> Day!` },
    { name: 'Easter', date: '04-04', response: `Happy <span class='special'>Easter</span>!` },
    { name: 'Christmas', date: '12-25', response: `Merry <span class='special'>Christmas</span>! (Jingle!)` },
    { name: 'Independence Day (USA)', date: '07-04', response: `Happy <span class='special'>Independence</span> Day!` },
    { name: 'Bastille Day (France)', date: '07-14', response: `Joyeux <span class='special'>14</span> juillet!` },
    { name: 'Onam', date: calculateOnamDate(), response: `Happy <span class='special'>Onam</span>!<br>Feel Special!` },
    { name: 'Republic Day (India)', date: '01-26', response: `Happy <span class='special'>Republic</span> Day!` },
    { name: 'Good Friday', date: 'varies (April)', response: `<span class='special'>Good Friday</span> Wishes!` },
    { name: 'Independence Day (India)', date: '08-15', response: `Happy <span class='special'>Independence</span> Day!` },
    { name: 'St. Stephen\'s Day', date: '12-26', response: `Happy <span class='special'>St. Stephen\'s</span> Day!` },
    { name: 'Epiphany (Three Kings\' Day)', date: '01-06', response: `Happy <span class='special'>Epiphany</span>!` },
    { name: 'Showa Day', date: '04-29', response: `Happy <span class='special'>Showa</span> Day!` },
    { name: 'Goku Day', date: '05-09', response: `Happy <span class='special'>Goku</span> Day!<br>Kamehameha!` },
    { name: 'Pokémon Day', date: '02-27', response: `Happy <span class='special'>Pokémon</span> Day! Catch 'em all!` },
];

// Function to check if today is a holiday and display a message
const checkHoliday = () => {
    const currentDate = new Date();
    const currentMonth = (currentDate.getMonth() + 1).toString().padStart(2, '0');
    const currentDay = currentDate.getDate().toString().padStart(2, '0');
    const today = `${currentMonth}-${currentDay}`;
    const holiday = holidays.find(h => h.date === today);
    const holidayMessage = holiday ? `${holiday.response}` : `Be on the <span class="special">Right</span><br>Side of History`;
    document.querySelectorAll('.random h1.message').forEach((day) => { day.innerHTML = holidayMessage; })
}; checkHoliday();

// Accordion
document.addEventListener('DOMContentLoaded', function () {
  const accordionTriggers = document.querySelectorAll('.accordion-trigger');
  accordionTriggers.forEach(function (trigger) {
    trigger.addEventListener('click', function () {
      const content = this.nextElementSibling;
      if (content.style.maxHeight) {
        content.style.maxHeight = null;
        content.classList.remove('show');
      } else {
        content.style.maxHeight = content.scrollHeight + 'px';
        content.classList.add('show');
      }
    });
  });
});